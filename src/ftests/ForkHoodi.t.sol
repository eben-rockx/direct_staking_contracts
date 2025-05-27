// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "../contracts/direct_staking.sol";
import "../contracts/rewardpool.sol";

contract ForkHoodiTest is Test {
    DirectStaking public directStaking;
    DirectStaking public directStakingImpl;
    RewardPool public rewardPool;
    RewardPool public rewardPoolImpl;
    ProxyAdmin public proxyAdmin;
    address public signer;
    uint256 public signerPrivateKey;
    address public constant claim = address(0x912AD2282799C5d62334017578418471f5aF5353);
    address public constant withdraw = address(0x0C99B08F2233b04066fe13A0A1Bf1474416fD77F);
    address public constant stake = address(0x912AD2282799C5d62334017578418471f5aF5353);
    address public constant owner = address(0x0C99B08F2233b04066fe13A0A1Bf1474416fD77F);

    function setUp() public {
        signerPrivateKey = vm.envUint("SIGNER_PRIVATE_KEY");
        signer = vm.addr(signerPrivateKey);

        vm.startPrank(owner);
        // Deploy ProxyAdmin
        proxyAdmin = new ProxyAdmin();

        // Deploy implementation contracts
        directStakingImpl = new DirectStaking();
        rewardPoolImpl = new RewardPool();

        // Deploy proxy contracts
        bytes memory directStakingData = abi.encodeWithSelector(DirectStaking.initialize.selector);
        bytes memory rewardPoolData = abi.encodeWithSelector(RewardPool.initialize.selector);

        TransparentUpgradeableProxy directStakingProxy =
            new TransparentUpgradeableProxy(address(directStakingImpl), address(proxyAdmin), directStakingData);

        TransparentUpgradeableProxy rewardPoolProxy =
            new TransparentUpgradeableProxy(address(rewardPoolImpl), address(proxyAdmin), rewardPoolData);

        // Cast proxy contracts to implementation interface
        directStaking = DirectStaking(payable(address(directStakingProxy)));
        rewardPool = RewardPool(payable(address(rewardPoolProxy)));

        // Set contract configurations
        directStaking.setSigner(signer);
        directStaking.setRewardPool(address(rewardPool));
        rewardPool.grantRole(rewardPool.CONTROLLER_ROLE(), address(directStaking));
        vm.stopPrank();

        deal(stake, 100 ether);
    }

    function _digest(DirectStaking.StakeParams memory params) private view returns (bytes32) {
        bytes32 digest = sha256(
            abi.encode(
                params.extraData,
                params.amount,
                address(directStaking),
                block.chainid,
                params.claimAddr,
                params.withdrawAddr
            )
        );

        for (uint256 i = 0; i < params.pubkeys.length; i++) {
            digest = sha256(abi.encode(digest, params.pubkeys[i], params.signatures[i]));
        }

        return digest;
    }

    function testStakeCompound() public {
        // prepare test data
        bytes[] memory pubkeys = new bytes[](2);
        bytes[] memory signatures = new bytes[](2);
        pubkeys[0] =
            hex"aded8d5bc4959510069a6331101723826535e64eb4a492e686632ae9356b1eb8150fd014b1b68ce10e558729c6f7fe23";
        signatures[0] =
            hex"b0f951c3e060d2b087da35fa389ee26f30b96d668cbb5f568d7899480f160f6df9bda7b5f10e211bb6aa570e818422660f6e8a78547a0b3720f294063417451c12b40dfae0709046045db39567e7270c0a7060c61ace6c2c2f36ade40f830cf6";
        pubkeys[1] =
            hex"a4fc037ac8c17361a4f054b233b1682bccfadc00999c0c75e7b4408918abbd9f705d898df4c1f81362f020fe6e2684c3";
        signatures[1] =
            hex"a6ac5291bd090563aac8e3691958163d868e58339d54367c39699eb3e30f6132466691d97ffa356326556b6aa84f83e0123acda7aad04d3230d160eb26e774de680f78ea8cf5a96ba16b6b6d1fc92d1230428be9bcc954e5d8af7e97c4cda478";

        DirectStaking.StakeParams memory params = DirectStaking.StakeParams({
            extraData: 0,
            amount: 35 ether,
            claimAddr: claim,
            withdrawAddr: withdraw,
            pubkeys: pubkeys,
            signatures: signatures,
            paramsSig: _signStakeParams(0, 35 ether, claim, withdraw, pubkeys, signatures, signerPrivateKey)
        });

        // do the staking
        vm.startPrank(stake);
        uint256 totalAmount = params.amount * params.signatures.length;
        directStaking.stakeCompound{value: totalAmount}(params,0);
        vm.stopPrank();

        // check the state
        assertEq(directStaking.getNextValidators(), 2);
        (bytes memory storedPubkey, address storedClaimAddr, uint256 storedExtraData) =
            directStaking.getValidatorInfo(0);
        assertEq(storedPubkey, pubkeys[0]);
        assertEq(storedClaimAddr, claim);
        assertEq(storedExtraData, 0);
    }

    function _signStakeParams(
        uint256 extraData,
        uint256 amount,
        address claimAddr,
        address withdrawAddr,
        bytes[] memory pubkeys,
        bytes[] memory signatures,
        uint256 privateKey
    ) internal view returns (bytes memory) {
        bytes32 digest = _digest(
            DirectStaking.StakeParams({
                extraData: extraData,
                amount: amount,
                claimAddr: claimAddr,
                withdrawAddr: withdrawAddr,
                pubkeys: pubkeys,
                signatures: signatures,
                paramsSig: ""
            })
        );

        (uint8 v, bytes32 r, bytes32 s) =
            vm.sign(privateKey, keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", digest)));
        return abi.encodePacked(r, s, v);
    }

    function testPause() public {
        vm.startPrank(owner);
        directStaking.pause();
        vm.stopPrank();
        assertTrue(directStaking.paused());
    }

    function testUnpause() public {
        vm.startPrank(owner);
        directStaking.pause();
        directStaking.unpause();
        vm.stopPrank();
        assertFalse(directStaking.paused());
    }

    function testEmergencyExit() public {
        // First do staking
        testStake();

        // Execute emergency exit
        vm.startPrank(owner);
        directStaking.emergencyExit(0, true);
        vm.stopPrank();
    }

    function testBatchEmergencyExit() public {
        // Prepare multiple stakes
        testStake();

        uint256[] memory validatorIds = new uint256[](1);
        validatorIds[0] = 0;

        vm.startPrank(owner);
        directStaking.batchEmergencyExit(validatorIds, true);
        vm.stopPrank();
    }

    function testFailStakeWithInvalidSignature() public {
        bytes[] memory pubkeys = new bytes[](1);
        bytes[] memory signatures = new bytes[](1);
        pubkeys[0] =
            hex"aded8d5bc4959510069a6331101723826535e64eb4a492e686632ae9356b1eb8150fd014b1b68ce10e558729c6f7fe23";
        signatures[0] =
            hex"b0f951c3e060d2b087da35fa389ee26f30b96d668cbb5f568d7899480f160f6df9bda7b5f10e211bb6aa570e818422660f6e8a78547a0b3720f294063417451c12b40dfae0709046045db39567e7270c0a7060c61ace6c2c2f36ade40f830cf6";

        DirectStaking.StakeParams memory params = DirectStaking.StakeParams({
            extraData: 0,
            amount: 32 ether,
            claimAddr: claim,
            withdrawAddr: withdraw,
            pubkeys: pubkeys,
            signatures: signatures,
            paramsSig: hex"aded8d5bc4959510069a6331101723826535e64eb4a492e686632ae9356b1eb8150fd014b1b68ce10e558729c6f7fe23" // Invalid signature
        });

        vm.startPrank(stake);
        uint256 totalAmount = params.amount * params.signatures.length;
        directStaking.stakeCompound{value: totalAmount}(params,0);
        vm.stopPrank();
    }

    function testFailStakeWithInsufficientValue() public {
        bytes[] memory pubkeys = new bytes[](1);
        bytes[] memory signatures = new bytes[](1);
        pubkeys[0] =
            hex"aded8d5bc4959510069a6331101723826535e64eb4a492e686632ae9356b1eb8150fd014b1b68ce10e558729c6f7fe23";
        signatures[0] =
            hex"b0f951c3e060d2b087da35fa389ee26f30b96d668cbb5f568d7899480f160f6df9bda7b5f10e211bb6aa570e818422660f6e8a78547a0b3720f294063417451c12b40dfae0709046045db39567e7270c0a7060c61ace6c2c2f36ade40f830cf6";

        DirectStaking.StakeParams memory params = DirectStaking.StakeParams({
            extraData: 0,
            amount: 32 ether,
            claimAddr: claim,
            withdrawAddr: withdraw,
            pubkeys: pubkeys,
            signatures: signatures,
            paramsSig: _signStakeParams(0, 32 ether, claim, withdraw, pubkeys, signatures, signerPrivateKey)
        });

        vm.startPrank(stake);
        // Intentionally send insufficient ETH
        directStaking.stakeCompound{value: 31 ether}(params,0);
        vm.stopPrank();
    }

    function testFailSetSignerUnauthorized() public {
        vm.prank(address(0x1234));
        directStaking.setSigner(address(0x5678));
    }

    function testFailEmergencyExitUnauthorized() public {
        vm.prank(address(0x1234));
        directStaking.emergencyExit(0, true);
    }

    function _digest(
        uint256 extraData,
        address claimAddr,
        address withdrawAddr,
        bytes[] memory pubkeys,
        bytes[] memory signatures
    ) private view returns (bytes32) {
        bytes32 digest = sha256(
            abi.encode(
                extraData,
                address(directStaking),
                block.chainid,
                claimAddr,
                withdrawAddr
            )
        );

        for (uint256 i = 0; i < pubkeys.length; i++) {
            digest = sha256(abi.encode(digest, pubkeys[i], signatures[i]));
        }

        return digest;
    }

    function testStake() public {
        // prepare test data
        bytes[] memory pubkeys = new bytes[](2);
        bytes[] memory signatures = new bytes[](2);
        pubkeys[0] =
            hex"8c59a2f729051625b9473e222798101eb5571b8ed8b83c40c3963b9a8f9171c20bef5ca5fe9c096c33736c0ccb4bee69";
        signatures[0] =
            hex"a77a3912dbdf78313a8ab593e3258216428a63e812102aeabc25362c5d05afc7b0c0329d381082315aa40424524af4480816aa7251e3d0bd6195699e99fc023820beb7ccd16e7de55de27dcd2905fb00434e0c455fa0288e58517f1c1b0676f9";
        pubkeys[1] =
            hex"91aadc90df2fa2db6ae55a701ddb3f883951a267cec635ddcd953bd23e314c4bd915178e4e6c16b9b300d3a5275a720d";
        signatures[1] =
            hex"a833a55098980fdf96fbecc27c4079e70b6ec1c49e2a3d9b7a7041b235dfac686e845b718f21f52b0d29f1809fccf0441111a43b4b21b3443917afe5ddda51958a0c6c71e0ded0777f889d14747b8660a608f46a8fdc6b14afe13898a3b27154";

        bytes32 digest = _digest(0, claim, withdraw, pubkeys, signatures);
        (uint8 v, bytes32 r, bytes32 s) =
            vm.sign(signerPrivateKey, keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", digest)));
        bytes memory paramsSig = abi.encodePacked(r, s, v);

        // do the staking
        vm.startPrank(stake);
        uint256 totalAmount = 32 ether * signatures.length + 0.1 ether; // 32 ether per signature + 0.1 ether for gas
        directStaking.stake{value: totalAmount}(claim, withdraw, pubkeys, signatures, paramsSig, 0, 0.1 ether);
        vm.stopPrank();

        // check the state
        assertEq(directStaking.getNextValidators(), 2);
        (bytes memory storedPubkey, address storedClaimAddr, uint256 storedExtraData) =
            directStaking.getValidatorInfo(0);
        assertEq(storedPubkey, pubkeys[0]);
        assertEq(storedClaimAddr, claim);
        assertEq(storedExtraData, 0);
    }
}

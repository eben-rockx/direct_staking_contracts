// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "../contracts/direct_staking.sol";
import "../contracts/rewardpool.sol";

contract ForkHoodiOnlineTest is Test {
    DirectStaking public directStaking;
    address public constant DIRECT_STAKING_PROXY = address(0x16322Dc0700d4d2a11F3E65d5795Edc294894eC7);
    address public constant CLAIM_WITHDRAW_ADDR = address(0x5Ea021b0F5B814CAD162F350f01324c121142223);

    function setUp() public {
        directStaking = DirectStaking(payable(DIRECT_STAKING_PROXY));
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

    function testStake() public {
        bytes[] memory pubkeys = new bytes[](1);
        bytes[] memory signatures = new bytes[](1);
        pubkeys[0] = hex"aa2b252eaa9dc5f94c846e1382a588e3074c5b8f98bc85fe2bb9b0f6dfe6c72cf4f736ecec91fba578ed3b1486c8e10f";
        signatures[0] = hex"aec7a8fb5d5fec9287deb6362752f14b8e1aa0fcb1e8482b81b1ce9c128db281c05716895db2a7ba8f601fe69ba26e5d07bda1aa526e7f27e0d6742f9ac81677709698c47c544df6975447ab7f12fd7782254216c5449e41f2c9289cd0a61d7b";

        DirectStaking.StakeParams memory params = DirectStaking.StakeParams({
            extraData: 11830,
            amount: 41 ether,
            claimAddr: CLAIM_WITHDRAW_ADDR,
            withdrawAddr: CLAIM_WITHDRAW_ADDR,
            pubkeys: pubkeys,
            signatures: signatures,
            paramsSig: hex"5d7bad1442df463e14be54ca90255bb7df1cc996c03b767e3a9555b864b91ece3c368a432d3dde5b42cb414024a31f32f630cf3402de4033c12417a35ec766fd1c"
        });

        vm.startPrank(CLAIM_WITHDRAW_ADDR);
        uint256 totalAmount = params.amount * params.signatures.length + directStaking.tips();
        directStaking.stake{value: totalAmount}(params);
        vm.stopPrank();

        assertEq(directStaking.getNextValidators(), 1);
        (bytes memory storedPubkey, address storedClaimAddr, uint256 storedExtraData) = directStaking.getValidatorInfo(0);
        assertEq(storedPubkey, pubkeys[0]);
        assertEq(storedClaimAddr, CLAIM_WITHDRAW_ADDR);
        assertEq(storedExtraData, 11830);
    }
}
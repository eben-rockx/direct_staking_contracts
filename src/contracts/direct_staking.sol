// SPDX-License-Identifier: MIT
// ⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
// ⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
// ⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⢠⣤⣤⣤⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
// ⠉⠻⣿⡟⠛⠛⠻⣿⣄⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⣿⣿⡀⡀⡀⡀⡀⡀⡀⠙⢿⣿⡟⠁⡀⡀⠙⣿⠟⠁
// ⡀⡀⣿⡇⡀⡀⡀⢸⣿⡆⡀⡀⡀⡀⡀⣀⣀⡀⡀⡀⡀⡀⡀⡀⡀⣀⣀⣀⡀⡀⡀⡀⣿⣿⡀⡀⡀⡀⡀⡀⡀⡀⡀⢿⣿⡄⡀⡀⣾⠃⡀⡀
// ⡀⡀⣿⡇⡀⡀⡀⢸⣿⠃⡀⡀⡀⣾⡿⠉⠉⠙⣿⣄⡀⡀⡀⣴⣿⠋⠉⠻⣿⡄⡀⡀⣿⣿⡀⡀⠙⣿⠿⠉⡀⡀⡀⡀⢻⣿⣄⣿⠁⡀⡀⡀
// ⡀⡀⣿⣇⣀⣀⣤⡿⠋⡀⡀⡀⣼⣿⡀⡀⡀⡀⢸⣿⡀⡀⢠⣿⠃⡀⡀⡀⠛⡀⡀⡀⣿⣿⡀⢀⡿⠁⡀⡀⡀⡀⡀⡀⡀⢻⣿⡄⡀⡀⡀⡀
// ⡀⡀⣿⡏⠉⠻⣿⣄⡀⡀⡀⡀⣿⣿⡀⡀⡀⡀⠘⣿⡇⡀⢸⣿⡀⡀⡀⡀⡀⡀⡀⡀⣿⣿⣴⣿⣦⡀⡀⡀⡀⡀⡀⡀⢠⡿⢻⣿⡄⡀⡀⡀
// ⡀⡀⣿⡇⡀⡀⠻⣿⣆⡀⡀⡀⢿⣿⡀⡀⡀⡀⢸⣿⠁⡀⢸⣿⡀⡀⡀⡀⡀⡀⡀⡀⣿⣿⡀⠘⣿⣧⡀⡀⡀⡀⡀⣰⡟⡀⡀⢻⣿⡄⡀⡀
// ⡀⢀⣿⣧⡀⡀⡀⠻⣿⣦⡀⡀⠈⣿⣄⡀⡀⡀⣾⡿⡀⡀⡀⢿⣷⡀⡀⡀⣀⡄⡀⡀⣿⣿⡀⡀⠈⣿⣷⡀⡀⡀⣴⣿⡀⡀⡀⡀⢻⣿⣄⡀
// ⠛⠛⠛⠛⠛⡀⡀⡀⠈⠛⠛⡀⡀⡀⠛⠿⠿⠟⠋⡀⡀⡀⡀⡀⠙⠿⠿⠿⠛⡀⠘⠛⠛⠛⠛⡀⡀⡀⠙⠛⠛⠛⠛⠛⠛⡀⡀⠛⠛⠛⠛⠛
// ⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
// ⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
pragma solidity 0.8.9;

import "interfaces/iface.sol";
import "solidity-bytes-utils/contracts/BytesLib.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";


/**
 * @title RockX Ethereum Direct Staking Contract
 */
contract DirectStaking is Initializable, PausableUpgradeable, AccessControlUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20 for IERC20;
    using Address for address payable;
    using Address for address;

    // structure to record taking info.
    struct ValidatorInfo {
        bytes pubkey;
        address claimAddr;
        uint256 extraData; // a 256bit extra data, could be used in DID to ref a user

        // mark exiting
        bool exiting;
    }

    struct StakeParams {
        uint256 extraData;
        uint256 amount;
        address claimAddr;
        address withdrawAddr;
        bytes[] pubkeys;
        bytes[] signatures;
        bytes paramsSig;
    }
    // Variables in implementation v0 
    bytes32 public constant REGISTRY_ROLE = keccak256("REGISTRY_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    uint256 public constant DEPOSIT_SIZE = 32 ether;
    uint256 public constant MAX_DEPOSIT_SIZE = 2048 ether;

    uint256 private constant DEPOSIT_AMOUNT_UNIT = 1000000000 wei;
    uint256 private constant SIGNATURE_LENGTH = 96;
    address public constant ethDepositContract = 0x00000000219ab540356cBB839Cbe05303d7705Fa;

    /**
        Incorrect storage preservation:

        |Implementation_v0   |Implementation_v1        |
        |--------------------|-------------------------|
        |address _owner      |address _lastContributor | <=== Storage collision!
        |mapping _balances   |address _owner           |
        |uint256 _supply     |mapping _balances        |
        |...                 |uint256 _supply          |
        |                    |...                      |
        Correct storage preservation:

        |Implementation_v0   |Implementation_v1        |
        |--------------------|-------------------------|
        |address _owner      |address _owner           |
        |mapping _balances   |mapping _balances        |
        |uint256 _supply     |uint256 _supply          |
        |...                 |address _lastContributor | <=== Storage extension.
        |                    |...                      |
    */

    // Always extend storage instead of modifying it
    bytes private DEPOSIT_AMOUNT_LITTLE_ENDIAN;

    address public ___ethDepositContract_deprecated___;  // ETH 2.0 Deposit contract(DEPRECATED), use constant instead.
    address public rewardPool; // reward pool address
    address public sysSigner; // the signer for parameters in stake()

    // validator registry
    ValidatorInfo [] private validatorRegistry;

    // users's signed params to avert doubled staking
    mapping(bytes32=>bool) private signedParams;    

    // user apply for validator exit
    uint256 [] private exitQueue;

    // shanghai merge
    bool private ___shanghai_deprecated___;
   
    /**
     * @dev empty reserved space for future adding of variables
     */
    uint256[32] private __gap;

    /** 
     * ======================================================================================
     * 
     * SYSTEM SETTINGS, OPERATED VIA OWNER(DAO/TIMELOCK)
     * 
     * ======================================================================================
     */
    
    /**
     * @dev This contract will not accept direct ETH transactions.
     */
    receive() external payable {
        revert("Do not send ETH here");
    }

    /**
     * @dev pause the contract
     */
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    /**
     * @dev unpause the contract
     */
    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    /**
     * @dev disable implementation init
     */
    constructor() {
        _disableInitializers();
    }
    
    /**
     * @dev initialization
     */
    function initialize() initializer public {
        __Pausable_init();
        __AccessControl_init();
        __ReentrancyGuard_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(REGISTRY_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);

        // little endian deposit amount
        uint256 depositAmount = DEPOSIT_SIZE / DEPOSIT_AMOUNT_UNIT;
        DEPOSIT_AMOUNT_LITTLE_ENDIAN = to_little_endian_64(uint64(depositAmount));
    }

    /**
     * @dev set signer adress
     */
    function setSigner(address _signer) external onlyRole(DEFAULT_ADMIN_ROLE) {
        sysSigner = _signer;

        emit SignerSet(_signer);
    }

    /**
     * @dev set reward pool contract address
     */
    function setRewardPool(address _rewardPool) external onlyRole(DEFAULT_ADMIN_ROLE) {
        rewardPool = _rewardPool;

        emit RewardPoolContractSet(_rewardPool);
    }

    /**
     * ======================================================================================
     * 
     * VIEW FUNCTIONS
     * 
     * ======================================================================================
     */

    /**
     * @dev verify signer of the paramseters
     */
    function verifySigner(
        uint256 extraData,
        address claimaddr,
        address withdrawaddr,
        bytes[] calldata pubkeys,
        bytes[] calldata signatures,
        bytes calldata paramsSig) public view returns(bool) {

        // do not accept paramsSig.length == 64
        require(paramsSig.length != 64, "PARAMSIG64");

        // params signature verification
        bytes32 digest = ECDSA.toEthSignedMessageHash(_digest(extraData, claimaddr, withdrawaddr, pubkeys, signatures));
        address signer = ECDSA.recover(digest, paramsSig);

        return (signer == sysSigner);
    }

    /**
     * @dev verify signer of the paramseters
     */
    function verifySigner(StakeParams calldata params) public view returns (bool) {
        // do not accept paramsSig.length == 64
        require(params.paramsSig.length != 64, "USR001");

        // params signature verification
        bytes32 digest = ECDSA.toEthSignedMessageHash(_digest(params));
        address signer = ECDSA.recover(digest, params.paramsSig);

        return (signer == sysSigner);
    }

    /**
     * @dev return registered validator by index
     */
    function getValidatorInfo(uint256 idx) external view returns (
        bytes memory pubkey,
        address claimAddress,
        uint256 extraData
     ){
        ValidatorInfo storage info = validatorRegistry[idx];  
        return (info.pubkey, info.claimAddr, info.extraData);
    }

    /**
     * @dev return registered validator by range
     */
    function getValidatorInfos(uint256 from, uint256 to) external view returns (
        bytes [] memory pubkeys,
        address [] memory claimAddresses,
        uint256 [] memory extraDatas
     ){
        pubkeys = new bytes[](to - from);
        claimAddresses =  new address[](to - from);
        extraDatas = new uint256[](to - from);

        uint256 counter = 0;
        for (uint i = from; i < to;i++) {
            ValidatorInfo storage info = validatorRegistry[i];
            pubkeys[counter] = info.pubkey;
            claimAddresses[counter] = info.claimAddr;
            extraDatas[counter] = info.extraData;

            counter++;
        }
    }

    /**
     * @dev return validators count
     */
    function getNextValidators() external view returns (uint256) { return validatorRegistry.length; }

    /**
     * @dev return exit queue
     */
    function getExitQueue(uint256 from, uint256 to) external view returns (uint256[] memory) { 
        uint256[] memory ids = new uint256[](to - from);
        uint256 counter = 0;
        for (uint i = from; i < to;i++) {
            ids[counter] = exitQueue[i];
            counter++;
        }
        return ids;
    }

    /**
     * @dev return exit queue length
     */
    function getExitQueueLength() external view returns (uint256) { return exitQueue.length; }

    /**
     * ======================================================================================
     * 
     * USER EXTERNAL FUNCTIONS
     * 
     * ======================================================================================
     */
     
    /**
     * @dev user stakes
     */
    function stake(
        address claimaddr,
        address withdrawaddr,
        bytes[] calldata pubkeys,
        bytes[] calldata signatures,
        bytes calldata paramsSig, uint256 extradata, uint256 tips) external payable nonReentrant whenNotPaused {

        // global check
        _require(!signedParams[keccak256(paramsSig)], "REPLAYED_PARAMS");
        _require(signatures.length <= 500, "RISKY_DEPOSITS");
        _require(signatures.length == pubkeys.length, "INCORRECT_SUBMITS");
        _require(sysSigner != address(0x0) &&
                ethDepositContract != address(0x0) &&
                rewardPool != address(0x0), 
                "NOT_INITIATED");


        // params signature verification
        _require(verifySigner(extradata, claimaddr, withdrawaddr, pubkeys, signatures, paramsSig), "SIGNER_MISMATCH");

        // validity check
        _require(withdrawaddr != address(0x0) &&
                    claimaddr != address(0x0),
                    "ZERO_ADDRESS");

        // may add a minimum tips for each stake 
        uint256 ethersToStake = msg.value - tips;
        _require(ethersToStake % DEPOSIT_SIZE == 0, "ETHERS_NOT_ALIGNED");
        uint256 nodesAmount = ethersToStake / DEPOSIT_SIZE;
        _require(signatures.length == nodesAmount, "MISMATCHED_ETHERS");

        // build withdrawal credential from withdraw address
        // uint8('0x1') + 11 bytes(0) + withdraw address
        bytes memory cred = abi.encodePacked(bytes1(0x01), new bytes(11), withdrawaddr);
        bytes32 withdrawal_credential = BytesLib.toBytes32(cred, 0);

        // deposit
        for (uint256 i = 0;i < nodesAmount;i++) {
            ValidatorInfo memory info;
            info.pubkey = pubkeys[i];
            info.claimAddr = claimaddr;
            info.extraData = extradata;
            validatorRegistry.push(info);

            // deposit to offical contract.
            _deposit(pubkeys[i], signatures[i], withdrawal_credential, DEPOSIT_SIZE);
        }

        // update signedParams to avert repeated use of signature
        signedParams[keccak256(paramsSig)] = true;
    
        // log
        emit Staked(msg.sender, msg.value);
    }

    /**
     * @dev user stakes
     */
    /**
     * @dev Allows users to stake ETH for validator registration
     * @param params The staking parameters including:
     *        - extraData: Additional data for user reference
     *        - withdrawCredentialType: Type of withdrawal credentials (1 or 2)
     *        - amount: Amount of ETH to stake per validator
     *        - claimAddr: Address to claim rewards
     *        - withdrawAddr: Address for withdrawals
     *        - pubkeys: List of validator public keys
     *        - signatures: List of validator signatures
     *        - paramsSig: Signature of the parameters by system signer
     * @notice Requires msg.value to equal (amount * number of validators + tips)
     * @notice Each validator requires bigger than DEPOSIT_SIZE (32 ETH)
     * @notice Maximum 500 validators can be registered in a single transaction
     * @notice Emits a Staked event
     */
    function stakeCompound(StakeParams calldata params, uint256 tips) external payable nonReentrant whenNotPaused {
        // global check
        _require(!signedParams[keccak256(params.paramsSig)], "USR002");
        _require(params.signatures.length <= 500, "USR003");
        _require(params.signatures.length == params.pubkeys.length, "USR004");
        _require(params.amount >= DEPOSIT_SIZE, "USR006");
        _require(params.amount <= MAX_DEPOSIT_SIZE, "USR007");
        // validity check
        _require(params.withdrawAddr != address(0x0) &&
                    params.claimAddr != address(0x0),
                    "SYS001");
        // may add a minimum tips for each stake
        uint256 ethersToStake = msg.value - tips;
        _require(ethersToStake == params.amount * params.signatures.length, "USR008");

        // params signature verification
        _require(verifySigner(params), "USR015");

        // build withdrawal credential from withdraw address
        // uint8('0x2') + 11 bytes(0) + withdraw address
        bytes memory cred = abi.encodePacked(bytes1(0x02), new bytes(11), params.withdrawAddr);
        bytes32 withdrawal_credential = BytesLib.toBytes32(cred, 0);

        // deposit
        for (uint256 i = 0; i < params.signatures.length; i++) {
            ValidatorInfo memory info;
            info.pubkey = params.pubkeys[i];
            info.claimAddr = params.claimAddr;
            info.extraData = params.extraData;
            validatorRegistry.push(info);

            // deposit to offical contract.
            _deposit(params.pubkeys[i], params.signatures[i], withdrawal_credential, params.amount);
        }

        // update signedParams to avert repeated use of signature
        signedParams[keccak256(params.paramsSig)] = true;

        // log
        emit StakedCompound(msg.sender, msg.value);
    }

    /**
     * @dev users initiates exit for his validator
     */
    function exit(uint256 validatorId) external {
        _exitValidator(validatorId, msg.sender);     
    }

    /**
     * @dev users initiates batch exit for his validators
     */
    function batchExit(uint256 [] memory validatorIds) external {
        for (uint i=0;i<validatorIds.length;i++) {
            _exitValidator(validatorIds[i], msg.sender);
        }
    }

    /**
     * @dev admin exit a validator in emergency, and return it's principal to validator owner,
     *  optionally to exit unclaimed mev rewards to claim address.
     *
     * NOTE: a user must have contact with us to perform this operation.
     */
    function emergencyExit(uint256 validatorId, bool exitToClaimAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _emergencyExit(validatorId, exitToClaimAddress);
    }

    /**
     * @dev batch emergency exit
     */
    function batchEmergencyExit(uint256 [] memory validatorIds, bool exitToClaimAddress) external onlyRole(DEFAULT_ADMIN_ROLE) {
        for (uint i=0;i<validatorIds.length;i++) {
            _emergencyExit(validatorIds[i], exitToClaimAddress);
        }
    }

    /** 

     * ======================================================================================
     *
     * INTERNAL FUNCTIONS
     *
     * ======================================================================================
     */

    /**
     * @dev emergency exit a validator
     */
    function _emergencyExit(uint256 validatorId, bool exitToClaimAddress) internal {
        ValidatorInfo storage info = validatorRegistry[validatorId];
        require(!info.exiting, "EXITING");
        require(info.claimAddr != address(0x0), "CLAIM_ADDR_MISMATCH");

        info.exiting = true;
        exitQueue.push(validatorId);

        // allow to exit to claim address
        //  condition:
        //      1. EOA
        //      2. contracts which accept ETH
        if (exitToClaimAddress) {
            IRewardPool(rewardPool).claimRewardsFor(info.claimAddr);
        }
    }

    /**
     * @dev exit a single validator 
     */
    function _exitValidator(uint256 validatorId, address sender) internal {
         ValidatorInfo storage info = validatorRegistry[validatorId];
        require(!info.exiting, "EXITING");
        require(sender == info.claimAddr, "CLAIM_ADDR_MISMATCH");

        info.exiting = true;
        exitQueue.push(validatorId);
    }

    /**
     * @dev Invokes a deposit call to the official Deposit contract
     */
    function _deposit(bytes calldata pubkey, bytes calldata signature, bytes32 withdrawal_credential, uint256 amount) internal {
        // Compute deposit data root (`DepositData` hash tree root)
        // https://etherscan.io/address/0x00000000219ab540356cbb839cbe05303d7705fa#code
        bytes32 pubkey_root = sha256(abi.encodePacked(pubkey, bytes16(0)));
        bytes32 signature_root = sha256(abi.encodePacked(
            sha256(BytesLib.slice(signature, 0, 64)),
            sha256(abi.encodePacked(BytesLib.slice(signature, 64, SIGNATURE_LENGTH - 64), bytes32(0)))
        ));

        // little endian deposit amount
        uint256 depositAmount = amount / DEPOSIT_AMOUNT_UNIT;
        bytes memory deposit_amount_little_endian = to_little_endian_64(uint64(depositAmount));
        bytes32 depositDataRoot = sha256(abi.encodePacked(
            sha256(abi.encodePacked(pubkey_root, withdrawal_credential)),
            sha256(abi.encodePacked(deposit_amount_little_endian, bytes24(0), signature_root))
        ));

        IDepositContract(ethDepositContract).deposit{value:amount} (
            pubkey, abi.encodePacked(withdrawal_credential), signature, depositDataRoot);
    }

    /**
     * @dev to little endian
     * https://etherscan.io/address/0x00000000219ab540356cbb839cbe05303d7705fa#code
     */
    function to_little_endian_64(uint64 value) internal pure returns (bytes memory ret) {
        ret = new bytes(8);
        bytes8 bytesValue = bytes8(value);
        // Byteswapping during copying to bytes.
        ret[0] = bytesValue[7];
        ret[1] = bytesValue[6];
        ret[2] = bytesValue[5];
        ret[3] = bytesValue[4];
        ret[4] = bytesValue[3];
        ret[5] = bytesValue[2];
        ret[6] = bytesValue[1];
        ret[7] = bytesValue[0];
    }

    /**
     * @dev code size will be smaller
     */
    function _require(bool condition, string memory text) private pure {
        require (condition, text);
    }

    /**
     * @dev digest params
     */
    function _digest(
        uint256 extraData,
        address claimaddr,
        address withdrawaddr,
        bytes[] calldata pubkeys,
        bytes[] calldata signatures) private view returns (bytes32) {

        bytes32 digest = sha256(abi.encode(extraData, address(this), block.chainid, claimaddr, withdrawaddr));

        for (uint i=0;i<pubkeys.length;i++) {
            digest = sha256(abi.encode(digest, pubkeys[i], signatures[i]));
        }

        return digest;
    }

    /**
     * @dev digest params
     */
    function _digest(StakeParams calldata params) private view returns (bytes32) {
        bytes32 digest = sha256(
            abi.encode(
                params.extraData,
                params.amount,
                address(this),
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
    
    /**
     * ======================================================================================
     * 
     * SYSTEM EVENTS
     *
     * ======================================================================================
     */
    event RewardPoolContractSet(address addr);
    event SignerSet(address addr);
    event Staked(address addr, uint256 amount);
    event StakedCompound(address addr, uint256 amount);
}

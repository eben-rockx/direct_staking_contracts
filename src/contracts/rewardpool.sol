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
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

/**
 * @title Reward Pool
 */
contract RewardPool is Initializable, PausableUpgradeable, AccessControlUpgradeable, ReentrancyGuardUpgradeable, IRewardPool {
    using SafeERC20 for IERC20;
    using Address for address payable;
    using Address for address;

    bytes32 public constant MANAGER_ROLE = keccak256("MANAGER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant CONTROLLER_ROLE = keccak256("CONTROLLER_ROLE");
    bytes32 public constant ORACLE_ROLE = keccak256("ORACLE_ROLE");

    uint256 private constant MULTIPLIER = 1e18; 

    struct UserInfo {
        uint256 accSharePoint; // share starting point
        uint256 amount; // user's share
        uint256 rewardBalance;  // user's pending reward
    }
    
    uint256 public managerFeeShare; // manager's fee in 1/1000

    uint256 private managerRevenue; // manager's revenue
    uint256 private totalShares; // total shares
    uint256 private accShare;   // accumulated earnings per 1 share
    mapping(address => UserInfo) public userInfo; // claimaddr -> info

    uint256 private accountedBalance;   // for tracking of overall deposits

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
    receive() external payable { }

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
     * @dev initialization address
     */
    function initialize() initializer public {
        __Pausable_init();
        __AccessControl_init();
        __ReentrancyGuard_init();

        // init default values
        managerFeeShare = 200;  // 20%

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(CONTROLLER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
        _grantRole(MANAGER_ROLE, msg.sender);
    }

    /** 
     * ======================================================================================
     * 
     * MANAGER FUNCTIONS
     * 
     * ======================================================================================
     */
    /**
     * @dev manager withdraw revenue
     */
    function withdrawManagerRevenue(uint256 amount, address to) external nonReentrant onlyRole(MANAGER_ROLE)  {
        require(amount <= managerRevenue, "WITHDRAW_EXCEEDED_MANAGER_REVENUE");

        // track balance change
        _balanceDecrease(amount);
        managerRevenue -= amount;

        payable(to).sendValue(amount);

        emit ManagerFeeWithdrawed(amount, to);
    }

    /**
     * @dev set manager's fee in 1/1000
     */
    function setManagerFeeShare(uint256 milli) external onlyRole(DEFAULT_ADMIN_ROLE)  {
        require(milli >=0 && milli <=1000, "SHARE_OUT_OF_RANGE");
        managerFeeShare = milli;

        emit ManagerFeeSet(milli);
    }

    /** 
     * ======================================================================================
     * 
     * USER FUNCTIONS
     * 
     * ======================================================================================
     */
    /**
     * @dev Updates user shares in the reward pool
     * @param claimaddrs Array of claim addresses to update
     * @param deltas Array of share amounts to add/subtract (positive for adding, negative for subtracting)
     * @notice Only callable by ORACLE_ROLE
     * @notice Updates rewards before modifying shares
     * @notice Requirements:
     *  - Arrays must have the same length
     *  - Resulting user amount must not be negative
     *  - Updates total shares accordingly
     * @notice For each address:
     *  1. Settles pending rewards
     *  2. Updates user's share amount
     *  3. Updates total shares
     * @notice Emits a PoolUpdate event for each modification
     */
    function updatePool(address[] calldata claimaddrs, int256[] calldata deltas) external onlyRole(ORACLE_ROLE) {
        require(claimaddrs.length == deltas.length, "USR004");
        updateReward();
        if (claimaddrs.length == 0) {
            return;
        }
        for (uint256 i = 0; i < claimaddrs.length; i++) {
            address claimaddr = claimaddrs[i];
            int256 delta = deltas[i];

            if (delta > 0) {
                UserInfo storage info = userInfo[claimaddr];

                // settle current pending distribution
                info.rewardBalance += (accShare - info.accSharePoint) * info.amount / MULTIPLIER;
                info.amount += uint256(delta);
                info.accSharePoint = accShare;

                // update total shares
                totalShares += uint256(delta);
            } else if (delta < 0) {
                UserInfo storage info = userInfo[claimaddr];
                require(info.amount >= uint256(-delta), "USR013");

                // settle current pending distribution
                info.rewardBalance += (accShare - info.accSharePoint) * info.amount / MULTIPLIER;
                info.amount -= uint256(-delta);
                info.accSharePoint = accShare;

                // update total shares
                totalShares -= uint256(-delta);
            }
        }
        emit PoolUpdate(claimaddrs, deltas);
    }

    // claimRewards
    function claimRewards(address beneficiary, uint256 amount) external nonReentrant whenNotPaused {
        UserInfo storage info = userInfo[msg.sender];

        // settle current pending distribution
        info.rewardBalance += (accShare - info.accSharePoint) * info.amount / MULTIPLIER;
        info.accSharePoint = accShare;

        // check
        require(info.rewardBalance >= amount, "INSUFFICIENT_REWARD");

        // account & transfer
        info.rewardBalance -= amount;
        _balanceDecrease(amount);
        payable(beneficiary).sendValue(amount);

        // log
        emit Claimed(beneficiary, amount);
    }

    // claimRewardsFor an account, the rewards will be only be claimed to the claim address for safety
    //  this function plays the role as 'settler for accounts', could only be called by controller contract.
    function claimRewardsFor(address account) external nonReentrant whenNotPaused onlyRole(CONTROLLER_ROLE) {
        UserInfo storage info = userInfo[account];

        // settle current pending distribution
        info.rewardBalance += (accShare - info.accSharePoint) * info.amount / MULTIPLIER;
        info.accSharePoint = accShare;

        // account & transfer
        uint256 amount = info.rewardBalance;
        info.rewardBalance -= amount;
        _balanceDecrease(amount);
        payable(account).sendValue(amount);

        // log
        emit Claimed(account, amount);
    }

    /**
     * @dev updateReward of tx fee
     */
    function updateReward() internal {
        if (address(this).balance > accountedBalance && totalShares > 0) {
            (uint256 managerR, uint256 poolR) = _calcPendingReward();
            accShare += poolR * MULTIPLIER / totalShares;
            managerRevenue += managerR;
            accountedBalance = address(this).balance;
        }
    }

    /**
     * ======================================================================================
     * 
     * VIEW FUNCTIONS
     * 
     * ======================================================================================
     */
     function getTotalShare() external view returns (uint256) { return totalShares; }
     function getAccountedBalance() external view returns (uint256) { return accountedBalance; }


     function getPendingReward(address claimaddr) external view returns (uint256) {
        UserInfo storage info = userInfo[claimaddr];
        if (totalShares == 0) {  
            return info.rewardBalance;
        }
        
        uint256 poolReward;
        if (address(this).balance > accountedBalance) {
            (, poolReward) = _calcPendingReward();
        }

        return info.rewardBalance + (accShare + poolReward * MULTIPLIER / totalShares - info.accSharePoint)  * info.amount / MULTIPLIER;
     }

    function getPendingManagerRevenue() external view returns (uint256) {
        uint256 managerReward;
        if (address(this).balance > accountedBalance) {
            (managerReward, ) = _calcPendingReward();
        }

        return managerRevenue + managerReward;
     }

    /** 
     * ======================================================================================
     * 
     * INTERNAL FUNCTIONS
     * 
     * ======================================================================================
     */
    function _balanceDecrease(uint256 amount) internal { accountedBalance -= amount; }

    function _calcPendingReward() internal view returns (uint256 managerR, uint256 poolR)  {
        uint256 reward = address(this).balance - accountedBalance;

        // distribute to manager and pool
        managerR = reward * managerFeeShare / 1000;
        poolR = reward - managerR;

        return (managerR, poolR);
    }

    /**
     * ======================================================================================
     * 
     * SYSTEM EVENTS
     *
     * ======================================================================================
     */
    event Claimed(address beneficiary, uint256 amount);
    event ManagerFeeWithdrawed(uint256 amount, address to);
    event ManagerFeeSet(uint256 milli);
    event PoolUpdate(address[] claimaddr, int256[] amount);
}
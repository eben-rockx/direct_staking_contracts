// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "../contracts/rewardpool.sol";

contract ForkRewardOnlineTest is Test {
    address constant PROXY_ADDRESS = address(0xb4Fc89a143c764039537aBF965c6fD3d4D5475B0);
    address constant ADMIN_ADDRESS = address(0xE158817c9c8402058085F7b578270D43f3858595);

    address constant PROXY_ADDRESS_MAINNET = address(0xb7019c9184580b2E1f66fCDc3EB6c62621732064);
    address constant ADMIN_ADDRESS_MAINNET = address(0xa5F2B6AB5B38b88Ba221741b3A189999b4c889C6);
    
    function testUpgradeRewardHoodi() public {
        // Deploy implementation contract
        RewardPool rewardPoolImpl = new RewardPool();
        
        // Get Proxy contract instance
        TransparentUpgradeableProxy proxy = TransparentUpgradeableProxy(payable(PROXY_ADDRESS));
        
        // Execute upgrade
        vm.startPrank(ADMIN_ADDRESS);
        proxy.upgradeTo(address(rewardPoolImpl));
        vm.stopPrank();
        
        // Get upgraded contract instance
        RewardPool upgradedRewardPool = RewardPool(payable(PROXY_ADDRESS));
        
        // Print layout variables
        console.log("TotalShare:", upgradedRewardPool.getTotalShare());
        console.log("AccountedBalance:", upgradedRewardPool.getAccountedBalance());
        console.log("PendingManagerRevenue:", upgradedRewardPool.getPendingManagerRevenue());
        console.log("managerFeeShare:", upgradedRewardPool.managerFeeShare());

        address user = address(0x7F1fbA3D5572a8A267c236D28b492f388c4dB002);
        uint256 accSharePoint; // share starting point
        uint256 amount; // user's share
        uint256 rewardBalance;  // user's pending reward
        (accSharePoint, amount, rewardBalance) = upgradedRewardPool.userInfo(user);
        console.log("user addr:", user);
        console.log("user accSharePoint:", accSharePoint);
        console.log("user amount:", amount);
        console.log("user rewardBalance:", rewardBalance);
    }

    function testUpgradeRewardMainnet() public {
        // Deploy implementation contract
        RewardPool rewardPoolImpl = new RewardPool();
        
        // Get Proxy contract instance
        TransparentUpgradeableProxy proxy = TransparentUpgradeableProxy(payable(PROXY_ADDRESS_MAINNET));
        
        // Execute upgrade
        vm.startPrank(ADMIN_ADDRESS_MAINNET);
        proxy.upgradeTo(address(rewardPoolImpl));
        vm.stopPrank();
        
        // Get upgraded contract instance
        RewardPool upgradedRewardPool = RewardPool(payable(PROXY_ADDRESS_MAINNET));
        
        // Print layout variables
        console.log("TotalShare:", upgradedRewardPool.getTotalShare());
        console.log("AccountedBalance:", upgradedRewardPool.getAccountedBalance());
        console.log("PendingManagerRevenue:", upgradedRewardPool.getPendingManagerRevenue());
        console.log("managerFeeShare:", upgradedRewardPool.managerFeeShare());

        address user = address(0xd73f1D11Ebbf26165a6E503c0aed19bcE1Ff9241);
        uint256 accSharePoint; // share starting point
        uint256 amount; // user's share
        uint256 rewardBalance;  // user's pending reward
        (accSharePoint, amount, rewardBalance) = upgradedRewardPool.userInfo(user);
        console.log("user addr:", user);
        console.log("user accSharePoint:", accSharePoint);
        console.log("user amount:", amount);
        console.log("user rewardBalance:", rewardBalance);
    }
}
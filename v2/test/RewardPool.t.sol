// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "../contracts/rewardpool.sol";

contract RewardPoolTest is Test {
    RewardPool public rewardPool;
    RewardPool public rewardPoolImpl;
    ProxyAdmin public proxyAdmin;

    address public constant owner = address(0x1);
    address public constant user1 = address(0x2);
    address public constant user2 = address(0x3);

    function setUp() public {
        vm.startPrank(owner);
        // Deploy ProxyAdmin
        proxyAdmin = new ProxyAdmin();

        // Deploy implementation contract
        rewardPoolImpl = new RewardPool();

        // Deploy proxy contract
        bytes memory rewardPoolData = abi.encodeWithSelector(RewardPool.initialize.selector);
        TransparentUpgradeableProxy rewardPoolProxy =
            new TransparentUpgradeableProxy(address(rewardPoolImpl), address(proxyAdmin), rewardPoolData);

        // Cast proxy contract to implementation interface
        rewardPool = RewardPool(payable(address(rewardPoolProxy)));
        vm.stopPrank();

        // Give test accounts some ETH
        deal(user1, 100 ether);
        deal(user2, 100 ether);
    }

    function testInitialState() public view {
        assertEq(rewardPool.managerFeeShare(), 200); // Default manager fee is 20%
        assertTrue(rewardPool.hasRole(rewardPool.DEFAULT_ADMIN_ROLE(), owner));
        assertTrue(rewardPool.hasRole(rewardPool.CONTROLLER_ROLE(), owner));
        assertTrue(rewardPool.hasRole(rewardPool.PAUSER_ROLE(), owner));
        assertTrue(rewardPool.hasRole(rewardPool.MANAGER_ROLE(), owner));
        assertTrue(rewardPool.hasRole(rewardPool.ORACLE_ROLE(), owner));
    }

    function testUpdatePool() public {
        address[] memory users = new address[](2);
        int256[] memory deltas = new int256[](2);

        users[0] = user1;
        users[1] = user2;
        deltas[0] = 10 ether;
        deltas[1] = 20 ether;

        vm.startPrank(owner);
        rewardPool.updatePool(users, deltas);
        assertEq(rewardPool.getTotalShare(), 30 ether);

        deltas[0] = 5 ether;
        deltas[1] = -10 ether;
        rewardPool.updatePool(users, deltas);
        assertEq(rewardPool.getTotalShare(), 25 ether);
        vm.stopPrank();
    }

    function testClaimRewards() public {
        // First update user shares
        address[] memory users = new address[](1);
        int256[] memory deltas = new int256[](1);
        users[0] = user1;
        deltas[0] = 10 ether;

        vm.startPrank(owner);
        rewardPool.updatePool(users, deltas);

        // Send some rewards to contract
        vm.deal(address(rewardPool), 1 ether);
        address[] memory users1 = new address[](0);
        int256[] memory deltas1 = new int256[](0);
        rewardPool.updatePool(users1, deltas1);
        vm.stopPrank();

        // User claims rewards
        uint256 balanceBefore = user1.balance;
        vm.prank(user1);
        rewardPool.claimRewards(user1, 0.8 ether);

        assertEq(user1.balance - balanceBefore, 0.8 ether);
    }

    function testClaimRewardsFor() public {
        // First update user shares
        address[] memory users = new address[](1);
        int256[] memory deltas = new int256[](1);
        users[0] = user1;
        deltas[0] = 10 ether;

        vm.startPrank(owner);
        rewardPool.updatePool(users, deltas);

        // Send some rewards to contract
        vm.deal(address(rewardPool), 1 ether);

        address[] memory users1 = new address[](0);
        int256[] memory deltas1 = new int256[](0);
        rewardPool.updatePool(users1, deltas1);
        vm.stopPrank();

        // Controller claims rewards for user
        uint256 balanceBefore = user1.balance;
        vm.prank(owner);
        rewardPool.claimRewardsFor(user1);

        assertGt(user1.balance, balanceBefore);
    }

    function testManagerFeeWithdraw() public {
        // First update user shares and send rewards
        address[] memory users = new address[](1);
        int256[] memory deltas = new int256[](1);
        users[0] = user1;
        deltas[0] = 10 ether;

        vm.startPrank(owner);
        rewardPool.updatePool(users, deltas);
        vm.deal(address(rewardPool), 1 ether);
        address[] memory users1 = new address[](0);
        int256[] memory deltas1 = new int256[](0);
        rewardPool.updatePool(users1, deltas1);
        vm.stopPrank();

        // Manager withdraws fee
        uint256 balanceBefore = owner.balance;
        vm.prank(owner);
        rewardPool.withdrawManagerRevenue(0.2 ether, owner);

        assertEq(owner.balance - balanceBefore, 0.2 ether);
    }

    function testSetManagerFeeShare() public {
        vm.prank(owner);
        rewardPool.setManagerFeeShare(300); // Set to 30%
        assertEq(rewardPool.managerFeeShare(), 300);
    }

    function testPause() public {
        vm.prank(owner);
        rewardPool.pause();
        assertTrue(rewardPool.paused());
    }

    function testUnpause() public {
        vm.startPrank(owner);
        rewardPool.pause();
        rewardPool.unpause();
        vm.stopPrank();
        assertFalse(rewardPool.paused());
    }

    function testFailUpdatePoolUnauthorized() public {
        address[] memory users = new address[](1);
        int256[] memory deltas = new int256[](1);
        users[0] = user1;
        deltas[0] = 10 ether;

        vm.prank(user1);
        rewardPool.updatePool(users, deltas);
    }

    function testFailClaimRewardsWhenPaused() public {
        vm.prank(owner);
        rewardPool.pause();

        vm.prank(user1);
        rewardPool.claimRewards(user1, 1 ether);
    }

    function testFailWithdrawManagerRevenueUnauthorized() public {
        vm.prank(user1);
        rewardPool.withdrawManagerRevenue(1 ether, user1);
    }

    function testFailSetManagerFeeShareUnauthorized() public {
        vm.prank(user1);
        rewardPool.setManagerFeeShare(100);
    }

    function testFailSetInvalidManagerFeeShare() public {
        vm.prank(owner);
        rewardPool.setManagerFeeShare(1001); // Exceeds maximum value 1000
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "../contracts/direct_staking.sol";

contract ForkStakeOnlineTest is Test {
    address constant PROXY_ADDRESS = address(0x60Fa52A7Ba9Dc835E2b11ba3A48FfB240EEa52fD);
    address constant ADMIN_ADDRESS = address(0xE158817c9c8402058085F7b578270D43f3858595);

    address constant PROXY_ADDRESS_MAINNET = address(0xe8239B17034c372CDF8A5F8d3cCb7Cf1795c4572);
    address constant ADMIN_ADDRESS_MAINNET = address(0xa5F2B6AB5B38b88Ba221741b3A189999b4c889C6);
    
    function testUpgradeDirectStakingHoodi() public {
        // Deploy new version of DirectStaking contract
        DirectStaking newDirectStaking = new DirectStaking();
        
        // Get Proxy contract instance
        TransparentUpgradeableProxy proxy = TransparentUpgradeableProxy(payable(PROXY_ADDRESS));
        
        // Execute upgrade
        vm.startPrank(ADMIN_ADDRESS);
        proxy.upgradeTo(address(newDirectStaking));
        vm.stopPrank();
        
        // Get upgraded contract instance
        DirectStaking upgradedStaking = DirectStaking(payable (PROXY_ADDRESS));
        
        // Print layout variables
        console.log("DEPOSIT_SIZE:", upgradedStaking.DEPOSIT_SIZE());
        console.log("MAX_DEPOSIT_SIZE:", upgradedStaking.MAX_DEPOSIT_SIZE());
        console.log("ethDepositContract:", upgradedStaking.ethDepositContract());
        uint256 nextId = upgradedStaking.getNextValidators();
        console.log("getNextValidators:", nextId);
        uint256 exitId = upgradedStaking.getExitQueueLength();
        console.log("getExitQueueLength:", exitId);
        bytes memory pubkeyN;
        address addrN;
        uint256 extraN;
        (pubkeyN, addrN, extraN) = upgradedStaking.getValidatorInfo(0);
        console.logBytes(pubkeyN);
        console.log("getValidatorInfo 0 claimAddress:", addrN);
        console.log("getValidatorInfo 0 extraData:", extraN);
        
        (pubkeyN, addrN, extraN) = upgradedStaking.getValidatorInfo(nextId-1);
        console.logBytes(pubkeyN);
        console.log("getValidatorInfo N-1 claimAddress:", addrN);
        console.log("getValidatorInfo N-1 extraData:", extraN);
    }

    function testUpgradeDirectStakingMainnet() public {
        // Deploy new version of DirectStaking contract
        DirectStaking newDirectStaking = new DirectStaking();
        
        // Get Proxy contract instance
        TransparentUpgradeableProxy proxy = TransparentUpgradeableProxy(payable(PROXY_ADDRESS_MAINNET));
        
        // Execute upgrade
        vm.startPrank(ADMIN_ADDRESS_MAINNET);
        proxy.upgradeTo(address(newDirectStaking));
        vm.stopPrank();
        
        // Get upgraded contract instance
        DirectStaking upgradedStaking = DirectStaking(payable (PROXY_ADDRESS_MAINNET));
        
        // Print layout variables
        console.log("DEPOSIT_SIZE:", upgradedStaking.DEPOSIT_SIZE());
        console.log("MAX_DEPOSIT_SIZE:", upgradedStaking.MAX_DEPOSIT_SIZE());
        console.log("ethDepositContract:", upgradedStaking.ethDepositContract());
        uint256 nextId = upgradedStaking.getNextValidators();
        console.log("getNextValidators:", nextId);
        uint256 exitId = upgradedStaking.getExitQueueLength();
        console.log("getExitQueueLength:", exitId);
        bytes memory pubkeyN;
        address addrN;
        uint256 extraN;
        (pubkeyN, addrN, extraN) = upgradedStaking.getValidatorInfo(0);
        console.logBytes(pubkeyN);
        console.log("getValidatorInfo 0 claimAddress:", addrN);
        console.log("getValidatorInfo 0 extraData:", extraN);
        
        (pubkeyN, addrN, extraN) = upgradedStaking.getValidatorInfo(nextId-1);
        console.logBytes(pubkeyN);
        console.log("getValidatorInfo N-1 claimAddress:", addrN);
        console.log("getValidatorInfo N-1 extraData:", extraN);
    }
}
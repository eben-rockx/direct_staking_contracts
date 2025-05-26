// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import {Script, console} from "forge-std/Script.sol";
import {RewardPool} from "../contracts/RewardPool.sol";
import {ProxyAdmin} from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

/*
# prepare .env file
DEPLOYER=<deployer-account-name>
DEPLOYER_ADDRESS=<deployer-address>
PROXY_ADMIN=<proxy-admin-address>
EVM_RPC=<evm-rpc>
ETHERSCAN_API_KEY=<etherscan-api-key>
ETHERSCAN_API_URL=<etherscan-api-url>

# source .env
# verify source code
forge script -vvvv \
    --account $DEPLOYER \
    --sender $DEPLOYER_ADDRESS \
    -f $EVM_RPC \
    --broadcast \
    --verify \
    --verifier custom \
    --verifier-api-key $ETHERSCAN_API_KEY \
    --verifier-url $ETHERSCAN_API_URL \
    script/deploy_rewardpool.s.sol:DeployRewardPool

# verify source code using flatted code
forge script -vvvv \
    --account $DEPLOYER \
    --sender $DEPLOYER_ADDRESS \
    -f $EVM_RPC \
    --broadcast \
    script/deploy_rewardpool.s.sol:DeployRewardPool
*/

contract DeployRewardPool is Script {
    function run() external {
        // Read all required parameters from environment variables
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        address proxyAdmin = vm.envAddress("PROXY_ADMIN");

        vm.startBroadcast(deployer);

        // Print deployment parameters
        console.log("=== Deployment Parameters ===");
        console.log("Deployer:", deployer);
        console.log("ProxyAdmin:", proxyAdmin);

        // Deploy implementation contract
        RewardPool implementation = new RewardPool();
        console.log("\n=== Deployment Results ===");
        console.log("Implementation deployed at:", address(implementation));

        // Prepare initialization data
        bytes memory initData = abi.encodeWithSelector(
            RewardPool.initialize.selector
        );

        // Deploy proxy contract using existing ProxyAdmin
        TransparentUpgradeableProxy proxy = new TransparentUpgradeableProxy(
            address(implementation),
            proxyAdmin,
            initData
        );
        console.log("Proxy deployed at:", address(proxy));
        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import {Script, console} from "forge-std/Script.sol";
import {ProxyAdmin} from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

/*
# prepare .env file
DEPLOYER=<deployer-account-name>
DEPLOYER_ADDRESS=<deployer-address>
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
    script/deploy_proxyadmin.s.sol:DeployProxyAdmin

# verify source code using flatted code
forge script -vvvv \
    --account $DEPLOYER \
    --sender $DEPLOYER_ADDRESS \
    -f $EVM_RPC \
    --broadcast \
    script/deploy_proxyadmin.s.sol:DeployProxyAdmin
*/

contract DeployProxyAdmin is Script {
    function run() external {
        // Get deployer address from environment variables
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");

        vm.startBroadcast(deployer);

        // Print deployment parameters
        console.log("=== Deployment Parameters ===");
        console.log("Deployer:", deployer);

        // Deploy ProxyAdmin contract
        ProxyAdmin proxyAdmin = new ProxyAdmin();
        console.log("\n=== Deployment Results ===");
        console.log("ProxyAdmin deployed at:", address(proxyAdmin));

        vm.stopBroadcast();
    }
}
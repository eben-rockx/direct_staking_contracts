// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import {Script, console} from "forge-std/Script.sol";
import {DirectStaking} from "../contracts/direct_staking.sol";
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
    fscripts/deploy_directstaking.s.sol:DDeployDirectStaking

# verify source code using flatted code
forge script -vvvv \
    --account $DEPLOYER \
    --sender $DEPLOYER_ADDRESS \
    -f $EVM_RPC \
    --broadcast \
    fscripts/deploy_directstaking.s.sol:DeployDirectStaking
*/

contract DeployDirectStaking is Script {
    function run() external {
        // Read all required parameters from environment variables
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");

        vm.startBroadcast(deployer);

        // Print deployment parameters
        console.log("=== Deployment Parameters ===");
        console.log("Deployer:", deployer);

        // Deploy implementation contract
        DirectStaking implementation = new DirectStaking();
        console.log("\n=== Deployment Results ===");
        console.log("Implementation deployed at:", address(implementation));
        vm.stopBroadcast();
    }
}
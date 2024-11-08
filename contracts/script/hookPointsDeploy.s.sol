// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import  "forge-std/Script.sol";
import "../src/PointsHook.sol"; 
import "v4-core/interfaces/IPoolManager.sol";

contract DeployPointsHook is Script {
    function run() external {
        // Load private key and necessary addresses from environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address poolManagerAddress = vm.envAddress("POOL_MANAGER");
        address vaultAddress = vm.envAddress("VAULT_ADDRESS");

        // Set parameters for the PointsHook contract
        string memory name = "LRT BBL";
        string memory symbol = "LBBL";

        // Begin broadcasting to deploy the contract
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the PointsHook contract
        PointsHook pointsHook = new PointsHook(
            IPoolManager(poolManagerAddress),
            vaultAddress,
            name,
            symbol
        );

        vm.stopBroadcast();

        console.log("PointsHook deployed at:", address(pointsHook));
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;  // Updated to match PoolManager version

import "forge-std/Script.sol";
import {PoolManager} from "@uniswap/v4-core/src/PoolManager.sol";
// import "../src/NoDelegateCall.sol";
// import "../src/ProtocolFees.sol";
// import "../src/ERC6909Claims.sol";
// import "../src/Extsload.sol";
// import "../src/Exttload.sol";

//   PoolManager deployed at: 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9

contract DeployPoolManager is Script {
    function setUp() public {}

    function run() public {
        // Load private key and addresses from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        
        // Log deployment info
        console.log("Deploying PoolManager with deployer:", deployerAddress);


        
        vm.startBroadcast(deployerPrivateKey);

        // Deploy PoolManager with deployer as initial owner
        PoolManager poolManager = new PoolManager(
            deployerAddress // initialOwner
        );

        console.log("PoolManager deployed at:", address(poolManager));

   
        vm.stopBroadcast();

        // Verify the deployment
        console.log("Verifying deployment...");
        console.log("Owner:", poolManager.owner());
        

    }
}
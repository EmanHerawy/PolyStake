// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;  // Updated to match PoolManager version

import "forge-std/Script.sol";
import "../src/Babylon.sol";


//   babylon on Babyty chain deployed at: 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9
        
contract DeployBabylonToken is Script {
    function setUp() public {}

    function run() public {
        // Load private key and addresses from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        
        // Log deployment info
        console.log("Deploying Babylon with deployer:", deployerAddress);

        uint256 initialEthBalance = deployerAddress.balance;
        console.log("Deployer ETH balance before deployment:", initialEthBalance);
        
        vm.startBroadcast(deployerPrivateKey);

        // Deploy Babylon with deployer as initial owner
        Babylon babylon = new Babylon();

        console.log("babylon deployed at:", address(babylon));

   
        vm.stopBroadcast();


        

    }
}
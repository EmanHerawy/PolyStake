// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "../src/Vault.sol";

// == Logs ==
//  Vault deployed at: 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9

contract DeployVault is Script {
    function run() external {
        // Load private key from environment variable (adjust the variable as per your setup)
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Address of the underlying asset (token) for the Vault
        address underlyingAsset = 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9; //   babylon on Babyty chain deployed at: 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9
        
        // Parameters for the Vault contract
        address owner = msg.sender;
        string memory name = "Babylon";
        string memory symbol = "BBL";

        // Start broadcasting to deploy the contract with deployer's private key
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the Vault contract
        Vault vault = new Vault(underlyingAsset, owner, name, symbol);

        // Stop broadcasting
        vm.stopBroadcast();

        console.log("Vault deployed at:", address(vault));
    }
}

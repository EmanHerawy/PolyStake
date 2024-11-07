// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


contract Vault is ERC4626, Ownable, ReentrancyGuard {
    IERC20 public underlyingAsset; 
    // The ERC-20 token that the vault holds
    // event Deposit(address indexed sender, address indexed receiver, uint256 assets, uint256 shares);
    event Withdraw(address indexed sender, address indexed receiver, uint256 assets, uint256 shares);
   
    // Constructor to set the initial token and vault parameters
    constructor(address _underlyingAsset, address _owner, string memory _name, string memory _symbol) ERC20(_name, _symbol) ERC4626(IERC20Metadata(_underlyingAsset)) Ownable(_owner) {
        underlyingAsset = IERC20(_underlyingAsset);
    }

    // ERC-4626 deposit function
       /// @notice Deposits assets into the vault
    /// @dev checks if the amount is not 0 then passes to Solady's implementation
    /// @dev if you want slippage protection use the overload of this function with minSharesOut
    /// @param assets The amount of assets to deposit
    /// @param to The address to mint the shares to
    function deposit(uint256 assets, address to)
        public
        override(ERC4626)
        nonReentrant
        returns (uint256 shares)
    {
        if (assets == 0) revert ZeroAmount();
        return super.deposit(assets, to);
    }

    // ERC-4626 withdraw function
      function withdraw(uint256 shares, address to, address owner) public override(ERC4626) nonReentrant returns (uint256 assets) {
        uint256 totalAssetsBefore = totalAssets();
        uint256 totalSupplyBefore = totalSupply();

        // Calculate the number of assets corresponding to the shares
        assets = (shares * totalAssetsBefore) / totalSupplyBefore;
         // Burn the shares being withdrawn
        _burn(msg.sender, shares);

        // Transfer the underlying asset to the receiver
        require(underlyingAsset.transfer(to, assets), "Transfer failed");

        emit Withdraw(msg.sender, to, assets, shares);
    }

    // ERC-4626 totalAssets function
    function totalAssets() public view override returns (uint256) {
        return underlyingAsset.balanceOf(address(this)); // Return the balance of the underlying asset in the vault
    }

    // Optional function to allow the owner to rescue funds (in case of emergencies)
    function rescueFunds(address to, uint256 amount) external onlyOwner {
        require(underlyingAsset.transfer(to, amount), "Rescue failed");
    }
  // Fake function to simulate BTC proof verification on Babylon. To be added when cross chain messaging between evm aand babylon is implemented
    // In a real implementation, this would interact with Babylon to verify BTC lockup proof
    function verifyBTCProof() public view returns (bool) {
        // Simulating proof verification
        return true;
    }
    //
    error ZeroAmount( );
}
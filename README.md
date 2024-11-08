# PolyStake

![OIG1.jpeg](https://cdn.dorahacks.io/static/files/193097a0006b1fcd3307d0f4800a0744.jpeg)

> A secure orbit chain leveraging Bitcoin and Ethereum's economic security with incentivized staking and trading mechanisms.

## Overview

PolyStake is an innovative blockchain platform that combines the economic security of Bitcoin and Ethereum with advanced staking and trading features. The platform incentivizes users to participate in network security through staking while maximizing their returns through efficient trading mechanisms.

## Key Features

### Liquid Restaked Tokens (LRT)

- Enables efficient capital utilization through liquid staking
- Maintains network security while providing token flexibility
- Allows users to participate in DeFi while staking

### Network Loyalty Points

- Rewards long-term network participants
- Tiered benefits based on participation level
- Enhanced trading privileges for loyal users

### Staking Mechanism

- Secure the network through token staking
- Earn rewards for maintaining network stability
- Flexible staking options to suit different user needs

### Trading with Hooks

- Advanced trading functionality with customizable hooks
- Automated trading strategies
- Enhanced market making capabilities

## Challenges

- Cross-chain communication between babylon and EVM is not yet implemented
- The staking monitoring system is not yet implemented and we wanted to use to share reward to btc stakers in our system
- Some gas issues with Altlayer
  Frontend Challenges in Developing the Staking dApp:

Understanding and Integrating Staking Functionalities:
As a frontend developer, implementing staking features for the first time required a solid understanding of staking flows. Ensuring users could easily stake, unstake, and track rewards was essential. Designing an intuitive user flow to make complex blockchain concepts accessible was a real challenge.

Wallet Compatibility and Integration:

A key challenge was finding a wallet solution that supported both BTC and ETH. The solution was using TOMO for BTC compatibility and Wagmi for ETH, simplifying multi-chain interactions. Additionally, Reown AppKit and the Reown AppKit Adapter helped abstract complexities, improving wallet connectivity and enhancing the user experience.

Implementing P2P API for Transaction List:

Another challenge was integrating the P2P API to show a transaction list from our own Layer 2 (L2) solution built with AltLayer. This required working with the API to fetch and display real-time transaction data for users. The solution was to create a clean and efficient transaction list interface, allowing users to easily view their staking activities and balances from the L2 network.

## created chain

- you can check transaction on the chain via https://babyty-explorer.alt.technology/address/0x92fB257891a69FBb600Dc7e79EA4A4541254a200

![Screenshot 2024-11-08 at 09.58.16.png](https://cdn.dorahacks.io/static/files/19309bdf9e8c9dcde59430d4836848e6.png)

## Demo

presentation slides
https://www.canva.com/design/DAGV2psRTkw/0_wzw_dSpllFy_WXPRepIQ/edit
[Video](https://drive.google.com/file/d/1vWNvWqikHicHFYpdVS5IWpZrHUxb2RVv/view?usp=sharing)

![photo_2024-11-07_21-12-06.jpg](https://cdn.dorahacks.io/static/files/1930979684d217c34183ad0494e86518.jpg)

![photo_2024-11-07_21-12-16.jpg](https://cdn.dorahacks.io/static/files/1930979909cbb38af82ba344308ad442.jpg)

![photo_2024-11-07_21-17-32.jpg](https://cdn.dorahacks.io/static/files/1930979c23f8431d3391c7c4e04b7b0f.jpg)

## deployment

- token : 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9

```bash forge create --rpc-url polychain --private-key <ur_pr_key> src/Babylon.sol:Babylon
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x92fB257891a69FBb600Dc7e79EA4A4541254a200
Deployed to: 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9
Transaction hash: 0x2173d631668a767cf1f283d2ae2e4d54cca54e4b8698ea584ec503d3b419eae7
```

- pool manager : 0x93A757d154BD920d31A447D7Cd351A72D84c72ca

```bash
forge create --rpc-url polychain --private-key <ur_pr_key> ./lib/v4-periphery/lib/v4-core/src/PoolManager.sol:PoolManager --constructor-args "0x92fB2578
91a69FBb600Dc7e79EA4A4541254a200"
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x92fB257891a69FBb600Dc7e79EA4A4541254a200
Deployed to: 0x93A757d154BD920d31A447D7Cd351A72D84c72ca
Transaction hash: 0xb49c9fc8c98c0d2e6c59be89a54e6374450030fe3c0a1b93921e20c4cbb0f9f9

```

- vault : 0x2Da18f05D7C4814daa5C5a56411d7b62206976d5

```bash

forge create --rpc-url polychain --private-key <ur_pr_key> src/Vault.sol:Vault --constructor-args 0x92fB257891a69FBb600Dc7e79EA4A4541254a200 0x0F9CAA931B6fe71e5380163ba20E618Af82CBAc9
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x92fB257891a69FBb600Dc7e79EA4A4541254a200
Deployed to: 0x2Da18f05D7C4814daa5C5a56411d7b62206976d5
Transaction hash: 0x831de960910298752ac08c08e5c1cb2aa502f3ae9f3740297bb53097e0aa3be5

```

- Hookpoints

```bash
forge create --rpc-url polychain     --private-key <ur_pr_key>     src/PointsHook.sol:PointsHook     --constructor-args 0x93A757d154BD920d31A447D7Cd351A72D84c72ca 0x2Da18f05D7C4814daa5C5a56411d7b62206976d5 "PolyPoint" "PPT"     --gas-limit 10000000
[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x92fB257891a69FBb600Dc7e79EA4A4541254a200
Deployed to: 0x4A2dE926c1AAe177FCD7F17CdB6AbB9c37847791
Transaction hash: 0x5c684577b5dc78588e3627752afc7c435e17c125c298a2808e7eb6df985eee27

```

## front end

https://github.com/Ty-HA/polystake-frontend

## contracts

https://github.com:EmanHerawy/PolyStake.git

## Getting Started

_Documentation coming soon_

## How Polystake enhances Babylon

by encouraging users to stake their tokens, Polystake helps secure the network and maintain stability. This incentivizes users to participate in network security, contributing to the overall health of the Babylon ecosystem. Additionally, the platform's trading features provide users with enhanced market-making capabilities, allowing them to maximize their returns while supporting network growth. By combining staking and trading mechanisms, Polystake offers a comprehensive solution for users looking to engage with the Babylon network.

## Security

PolyStake's security model leverages the robust economic security of both Bitcoin and Ethereum networks, providing a multi-layered approach to protecting user assets and network integrity.

## Contributing

We welcome contributions from the community! Please check back soon for our contribution guidelines.

## License

_License information coming soon_

## Contact

_Contact information coming soon_

---

**Note:** PolyStake is currently under development. Features and documentation will be updated as the project progresses.

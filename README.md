# LakeDiamond Smart Contracts

This repository contains the smart contracts for LakeDiamond.

## Installation

It is assumed you have `git` installed and know how to use the Terminal (or any Command line on Windows). Before proceeding please also install the most recent NodeJS. Even better, [install NVM](http://nvm.sh) to manage different versions of NodeJS. If on Windows, alternatives are [nvm-windows](https://bitfalls.com/bxqq) and [nodist](https://bitfalls.com/ass3).

Then:

- install Embark: `npm install -g embark`
- install [IPFS](https://bitfalls.com/epb2)
- install [Geth](https://bitfalls.com/exeg)
- clone this repo: `git clone https://gitlab.com/lakediamond/sc`
- `cd sc && npm install` 

Run `embark run` to open the dashboard and run a local development version of the smart contracts and the Ethereum blockchain. The contracts will auto-compile.

Execute other commands in another tab - leave `embark run` running.

## Testing

Run `embark test` in the folder.

## Deployment

You can deploy to development, testnet (Ropsten) or mainnet.

### Development

Generate a new address with [MEW](https://bitfalls.com/2018/02/19/first-ethereum-address-learning-use-myetherwallet/) or [MetaMask](https://bitfalls.com/2018/02/16/metamask-send-receive-ether/) and then export the private key. 

Then just copy the key into `MY_KEY_HERE` and copy the address into `MY_ADDRESS_HERE`. This will then be the address which will receive the tokens, and which will be pre-loaded with some fake Ether for local testing.

Run `embark build` to deploy to development.

### Testnet

### Mainnet

## Flattening

In order to be tested and played around with in a tool like Remix, or to be verified in a tool like Etherscan, a contract needs to be flattened. I.e. all of its dependencies need to be flattened into a single file. This is done with the following command executed from within the project folder's root:

```bash
scripts/flatten.pl --mainsol=CONTRACT.sol --remapdir="contracts/openzeppelin-solidity=node_modules/openzeppelin-solidity" --outputsol="contracts_flat/CONTRACT_flattened.sol"
```

Replace the word `CONTRACT` with the filename of the contract you're flattening. I.e. for the token contract `LKD.sol`, that would be `LKD`.

The result will be in `contracts_flat` with the suffix `_flattened`.

---

Featured contracts (each explained in more detail below):

1. The LKD Token Contract
2. The LKD ICO Contract (tbd)
3. The Vesting Contract (tbd)
4. The Reactor Process Logging Contract (tbd)
5. The Tokensite Orderbook Contract

## The LKD Token Contract

The LKD token has a total supply of 141120000. It is indivisible because it represents the minimum countable reactor usage time: 1 minute. Each token is 1 minute of time or 0.55 CHF monetary value.

The token has only one special function: `_burn`. This lets the token holder burn his own amount, but no one else's.

For full source of token contract please see `contracts/LKD_flattened.sol`.

### Audit

The token contract was only audited internally by the [Audithor.io](https://audithor.io) team, due to simplicity of the code. No external audit was deemed necessary.

## The LKD ICO Contract

To be done. Work in progress.

### Audit

Will be audited by at least one third party.

## The Vesting Contract

To be done. Work in progress.

### Audit

Being audited by [Audithor.io](https://audithor.io) partners. At least one external audit will also be performed once internal audit is finished.

## The Reactor Process Logging Contract

Still being architected.

### Audit

Will be audited by at least one third party.

## The Tokensite Orderbook Contract

Still being architected. Proof of concept phase.

### Audit

Will be audited by at least one third party.

## License

To be announced. For now, license is: do not use for anything.

## Contributing

Please submit an issue or PR with as much detail as possible.
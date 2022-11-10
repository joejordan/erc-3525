# ERC-3525 Extended

This is a fork of the official implementation of [ERC-3525](https://github.com/solv-finance/erc-3525).

ERC-3525 Extended adds a non-upgradeable version of the ERC-3525 token and includes niceties like NatSpec inheritance to the contracts.

## Requirements

- Solidity 0.8

## Setup

Run `npm install` in the root directory

## Unit Tests

Run `npm test` to run the unit tests

## Notes

If you are importing this project as a [Foundry](https://github.com/foundry-rs/foundry/) library and you are utilizing [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/) in your project, you will have to make sure any remappings you do in your `remappings.txt` match the directory structure found here.

As an example, ***ERC-3525 Extended*** uses the following to import contracts from OpenZeppelin:

`import "@openzeppelin/contracts/utils/Context.sol";`

If you are also using OpenZeppelin in your project, ensure that you are remapping `@openzeppelin` to `@openzeppelin/=lib/openzeppelin-contracts/`

Your remappings.txt file should thus contain a line that looks like this so that you can import ***ERC-3525 Extended*** contracts without issue:

`@openzeppelin/=lib/openzeppelin-contracts/`

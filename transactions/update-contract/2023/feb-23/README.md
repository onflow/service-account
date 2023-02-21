# Update FlowIDTableStaking Contract

> Feb 23, 2023

Upgrade to the FlowIDTableStaking contract as per this [pull request](https://github.com/onflow/flow-core-contracts/pull/350) to fix a bug in the staking contract

## Transaction

[upgrade-set-candidate.cdc](./upgrade-set-candidate.cdc)


| Contract                                     | Arguments                                                                                      | Multisig Link   | Transaction |
|----------------------------------------------|------------------------------------------------------------------------------------------------|-----------------|-------------|
| [FlowIDTableStaking.cdc](./FlowIDTableStaking.cdc)               | [arguments-update-contract-FlowIDTableStaking.json](./arguments-update-contract-FlowIDTableStaking.json) | [Update Contract]() | [Sealed Transaction](https://flowscan.org/transaction/) |



Used this to generate args:

`cat "./FlowIDTableStaking.cdc" | xxd -p -c0 | tr -d '\n'`


## Results
https://flowscan.org/transaction/11a3e45c89735a118db0ee9d2755f8050b0f4e1ac9e93de458cec3af0d89285f

# Update Epoch Contract

> Sep 11th, 2024

Upgrade to the Staking contract from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/448

This includes a bug fix for the staking contract.

## Transactions

1. Upgrade `FlowIDTableStaking`.

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-{Filename}-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt {Filename}.cdc
(Should produce no difference)
```
___


# Transaction 1

## Transaction 1 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/update_contract.cdc`
Args: `arguments-update-FlowIDTableStaking.json`

This transaction can be executed using the web tool.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:


___


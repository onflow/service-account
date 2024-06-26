# Update DKG, Staking, and Epoch Contracts

> Dec 6th, 2023

Upgrade to the DKG, Staking, and Epoch contracts from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/379

These include performance changes, small additions to events, and the addition of the automatic access node slots. 

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowDKG`.


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
Args: `arguments-update-FlowDKG.json`

This transaction can be executed using the web tool.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/8b25cd913f13c1a93ad60a3ab8788162e17f9b434699b2fe85cd67df173f18c1

___

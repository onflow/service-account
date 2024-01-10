# Update Epoch Contract

> Jan 10th, 2023

Upgrade to the Epoch contract from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/397

This includes a security fix for the epoch random source.

## Transactions

1. Upgrade `FlowEpoch`.

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
Args: `arguments-update-FlowEpoch.json`

This transaction can be executed using the web tool.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/a10c01a57095365a2d535556834b6d19c7d2a441d9b5ac18aba684af4895b804

___


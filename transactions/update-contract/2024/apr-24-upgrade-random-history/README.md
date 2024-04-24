# Update RandomBeaconHistory Contract

> Apr 24th, 2024

Upgrade to the `RandomBeaconHistory` contract from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/416

This includes an update to ensure that past randomness sources are recorded properly.

## Transactions

1. Upgrade `RandomBeaconHistory`.

Needs to be signed with the service account.

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

Signer: flow-service
Transaction: `templates/update_contract.cdc`
Args: `arguments-update-RandomBeaconHistory.json`

This transaction can be executed using the web tool.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [update_contract.cdc](../../../../templates/update_contract.cdc) |  | | |


### Results

Successful attempt:
https://www.flowdiver.io/tx/a98e290fa22979a2ea8566af79e30e8aca332548ea8a971598fa2b29966f64fe

___


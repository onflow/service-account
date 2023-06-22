# Update Epoch, LockedTokens, and FlowStakingCollection Contracts

> July 5th, 2023

Upgrade to all the Flow Epoch contracts, `LockedTokens`, and `FlowStakingCollection` as per this pull request:

- https://github.com/onflow/flow-core-contracts/pull/364

These include changes to enable delegator staking minimum
and move epoch admins to the service account.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowClusterQC`, `FlowDKG`, and `FlowIDTableStaking` and set delegator minimum to 50.

[upgrade_set_del_min.cdc](./upgrade_set_del_min.cdc)

2. Upgrade `LockedTokens` and `FlowStakingCollection`.

[upgrade_locked_collection.cdc](upgrade_locked_collection.cdc)

3. Upgrade `FlowEpoch` and move admin objects. Needs old way of signing.

[upgrade_epoch_move_admins.cdc](./upgrade_epoch_move_admins.cdc)

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-{Filename}-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt {Filename}.cdc
(Should produce no difference)
```

## Transaction 1 Sequence of signing: 

1. DapperLabs generates the Signature Request ID on the [site]() for the `upgrade_set_del_min.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

### Results

Successful attempt:
https://flowscan.org/transaction/

## Transaction 2 Sequence of signing: 

1. DapperLabs generates the Signature Request ID on the [site]() for the `upgrade_locked_collection.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Results

Successful attempt:
https://flowscan.org/transaction/


## Transaction 3 Sequence of signing: 

Must use the old way of signing because it is a multisig between the staking account and service account.



## Results

Successful attempt:
https://flowscan.org/transaction/



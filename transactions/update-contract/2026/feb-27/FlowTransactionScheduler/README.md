# Update FlowTransactionScheduler Contract

Upgrade the FlowTransactionScheduler contract to always emit the `PendingExecution` event
regardless of whether the transaction handler capability is borrowable.

Previously the event was only emitted when the handler could be borrowed. Now it is always
emitted, using an empty string for `transactionHandlerTypeIdentifier` to avoid panics when
a handler contract is broken or destroyed.

PR: https://github.com/onflow/flow-core-contracts/pull/583

## Transactions

[update contract](../../..)

- Update imports

`cat "./FlowTransactionScheduler.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionScheduler.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any):

Successful attempt:https://explorer.flow.com/tx/f789ab975fb98e54706ecc5a79b858004ca8c2ec08ce87466bc184296106c939

___

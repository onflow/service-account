# Update EVM Contract

Upgrade the FlowServiceAccount contract

PR: https://github.com/onflow/flow-core-contracts/pull/573https://github.com/onflow/flow-core-contracts/pull/573/changes

## Transactions

[update contract](../../..)

- Update imports

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt:https://www.flowscan.io/tx/63e53090715c5838f61044a982dd73b691b83c5f2ec8d2ab967387bed950f227

___


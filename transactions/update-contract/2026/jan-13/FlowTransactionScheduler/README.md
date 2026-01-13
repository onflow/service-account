# Update FlowTransactionScheduler Contract

Upgrade the FlowTransactionScheduler contract to include performance improvements.

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

Successful attempt:https://www.flowscan.io/tx/bf50d8b9e89658f420d7398623c5369115b542505d7a0c97c37775c27ff36d95


___


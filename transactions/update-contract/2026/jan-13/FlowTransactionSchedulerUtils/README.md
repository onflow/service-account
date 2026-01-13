# Update FlowTransactionSchedulerUtils Contract

Upgrade the FlowTransactionSchedulerUtils contract to include performance improvements.

## Transactions

[update contract](../../..)

- Update imports

`cat "./FlowTransactionSchedulerUtils.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowTransactionSchedulerUtils.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt:https://www.flowscan.io/tx/98994e4285e8bed7b5dd7c40bcc2af9d052c9875e409d5d4e99feaed650df7db


___


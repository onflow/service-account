# Update FlowTransactionScheduler Contract

Upgrade the FlowTransactionScheduler contract to simplify priority limits by removing
the shared effort pool between priorities. Each priority now has its own independent
effort limit per time slot with no shared capacity between priorities.

PR: https://github.com/onflow/flow-core-contracts/pull/580

## Transactions

### Upgrade Contract

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

### Result

Unsuccessful attempt (if any):

Successful attempt:

### Update Config

[set_config_details](set_config_details.cdc)

with

[args-set_config_details](args-set_config_details.json)

### Result

Unsuccessful attempt (if any):

Successful attempt:

___

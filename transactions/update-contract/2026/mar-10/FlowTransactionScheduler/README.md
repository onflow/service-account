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

1. Contract upgrade: https://www.flowscan.io/tx/56986c9278516d93f4d58ba51c18708ac27fbaaf31189fce95bbec52b1084150
2. Update args: https://www.flowscan.io/tx/a0df09188290b035d4dba8b78859090b5723d02dd75f3f409b6e94840a3c16ce
___

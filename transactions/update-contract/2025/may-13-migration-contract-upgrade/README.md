# Update EVM Contract

> May 13, 2025

Upgrade the Migration contract as per this [issue](https://github.com/onflow/service-account/issues/379)

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

jq -n --arg name "Migration" --arg value "$(xxd -p ./Migration-contract-update.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-Migration-contract-update.json

Verified using:
```
$ cat arguments-Migration-contract-update.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt Migration-contract-update.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt: 

___


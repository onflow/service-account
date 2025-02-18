# Update Migration Contract

> Feb 18rd, 2025

Upgrade to the Migration contract as per this [issue](https://github.com/onflow/service-account/issues/359)

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: https://www.flowscan.io/tx/e82215a3cd5edde90ae6ea8d5bd21d375e8deed339576d19b5be6acb3534ba3e

___


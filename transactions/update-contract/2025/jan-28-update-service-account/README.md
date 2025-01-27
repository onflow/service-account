# Update FlowServiceAccount Contract

> Jan 28th, 2025

Upgrade to the FlowServiceAccount contract as per this [issue](https://github.com/onflow/flow-go/issues/6894)

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

Successful attempt: 


___


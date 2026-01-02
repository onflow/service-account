# Update EVM Contract

> Jan 1st, 2026

Upgrade the EVM contract

PR: https://github.com/onflow/flow-go/pull/8272

## Transactions

[update contract](../../../../transactions/update-contract)

- Update imports

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-evm.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): 

Successful attempt:https://www.flowscan.io/tx/0b5312110b73221bdccff55d3907f88fdc5944fa6ad181a848695cc84fde6ec3

___


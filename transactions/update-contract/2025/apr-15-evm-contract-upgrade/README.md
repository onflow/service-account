# Update EVM Contract

> Apr 14, 2025

Upgrade the EVM contract as per this [issue](https://github.com/onflow/service-account/issues/375)

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

`wget https://raw.githubusercontent.com/onflow/flow-go/refs/tags/v0.40.0-rc.0/fvm/evm/stdlib/contract.cdc` 

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

Successful attempt: https://www.flowscan.io/tx/6d98f0fc24b2c24e41f558c405bc8d25ab5e945e2565101ef0be285cd8ccad8a

___


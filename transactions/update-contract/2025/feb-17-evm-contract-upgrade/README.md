# Update EVM Contract

> Feb 17th, 2025

Upgrade the EVM contract as per this [issue](https://github.com/onflow/service-account/issues/361)

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

`wget https://raw.githubusercontent.com/onflow/flow-go/refs/tags/v0.38.1/fvm/evm/stdlib/contract.cdc` 

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

Successful attempt: 

___


# Update Epoch Contract

> Oct 8th, 2024

Upgrade to the EVM contract as per this [issue](https://github.com/onflow/service-account/issues/336)

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

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


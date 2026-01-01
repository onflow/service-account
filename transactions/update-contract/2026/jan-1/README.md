# Update EVM Contract

> Jan 1st, 2026

Upgrade the EVM contract

## Transactions

[update contract](../../../../transactions/update-contract)

Used this to generate the contract code arguments:

` wget https://raw.githubusercontent.com/onflow/flow-go/299856f874e5db684f2b85801c399031a50cd777/fvm/evm/stdlib/contract.cdc` 

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

Successful attempt:

___


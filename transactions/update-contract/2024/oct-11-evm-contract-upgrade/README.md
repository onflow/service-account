# Update EVM Contract

> Oct 11th, 2024

Upgrade to the EVM contract as per this [issue](https://github.com/onflow/service-account/issues/338)

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

Unsuccessful attempt (if any): NA

Successful attempt: 
https://www.flowdiver.io/tx/6c15c318a8cf0bcbb3a1b03a99a7091ec1cd6c8d83eab02c259d99c75b8c3d04


___


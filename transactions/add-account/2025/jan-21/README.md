# Add a new account
Create a new mainnet account that will store execution parameters
See issue [353](https://github.com/onflow/service-account/issues/353).

There will be no keys on the account because the account will have a capability
that is stored in the service account.

The transaction will also deploy the `FlowExecutionParameters.cdc` to the account.

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/master/contracts/FlowExecutionParameters.cdc

## Transaction template

./add_fvm_metering_account.cdc

## Process

To generates hex encoded contract cdc 

```
cat "./FlowExecutionParameters.cdc" | xxd -p | tr -d '\n'
```

Arguments verified using:
```
$ cat arguments.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt ./FlowExecutionParameters.cdc
(Should produce no difference)
```


Tx ID:
New Account ID:
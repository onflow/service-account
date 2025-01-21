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


Tx ID: https://www.flowscan.io/tx/947369bab4a6bdd038ef0823be8bd941ef3c8ba188a9897c68a85885c63729ca
New Account ID: 0xf426ff57ee8f6110
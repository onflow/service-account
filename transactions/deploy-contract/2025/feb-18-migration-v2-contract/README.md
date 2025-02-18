# Deploy AccountV2Migration Contract

> Feb 18th, 2025

Deploy new Migration contract stub to the service account as per this [issue](https://github.com/onflow/service-account/issues/359)

## Transactions

[deploy contract](../../../../templates/deploy_contract.cdc)

Used this to generate the contract code arguments:

`cat "./contract.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-deploy-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt contract.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: 5874e5c306178927e80480a85641ff6b78a8a4e82d5000e8932fd5d6952100c3




___


# Update FlowServiceAccount Contract

> Feb 10th, 2025

Deploy new Migration contract stub to the service account as per this [issue](https://github.com/onflow/service-account/issues/358)

## Transactions

[deploy contract](../../../../templates/deploy_contract.cdc)

Used this to generate the contract code arguments:

`cat "./migration.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-deploy-contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt migration.cdc
(Should produce no difference)
```
___

### Results

Unsuccessful attempt (if any): NA

Successful attempt: https://www.flowscan.io/tx/fe7cca9cae4dbf222d281f9307a86bf4667e77fc4723b688a9725bd5832fe991


___


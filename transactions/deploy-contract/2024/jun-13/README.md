# Deploy [DependencyAudit.cdc](https://github.com/onflow/contract-updater/blob/main/contracts/DependencyAudit.cdc)

> June 13th, 2024

## Contract to be deployed

https://github.com/onflow/contract-updater/blob/main/contracts/DependencyAudit.cdc

See [issue](https://github.com/onflow/service-account/issues/294)

## Transaction template

`deploy_contract_dependency_audit.cdc`

## 

Arguments generated using:
```
cd transactions/deploy-contract/2024/jun-13

wget https://raw.githubusercontent.com/onflow/contract-updater/main/contracts/DependencyAudit.cdc

To generates hex encoded contract cdc 

cat "./DependencyAudit.cdc" | xxd -p | tr -d '\n'
```

Arguments verified using:
```
$ cat arguments.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt ./DependencyAudit.cdc
(Should produce no difference)
```


[Multi-sign setup](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

https://www.flowdiver.io/tx/14278ab0195eb0a1bfc6a1968dd8ed173dc5f3a7e59f5d0a01301d3067fffb75
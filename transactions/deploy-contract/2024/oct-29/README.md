# Deploy [Crypto.cdc](https://github.com/onflow/flow-core-contracts/blob/master/contracts/Crypto.cdc)

> October 29th, 2024

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/master/contracts/Crypto.cdc

## Transaction template

`templates/deploy_contract.cdc`

## 

Arguments generated using:
```
cd transactions/deploy-contract/2024/oct-29
wget https://github.com/onflow/flow-core-contracts/blob/master/contracts/Crypto.cdc
```

To generates hex encoded contract cdc 

```
cat "./Crypto.cdc" | xxd -p | tr -d '\n'
```

Arguments verified using:
```
$ cat arguments.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt ./Crypto.cdc
(Should produce no difference)
```


[Multi-sign setup](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


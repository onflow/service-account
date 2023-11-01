# Deploy [Random Beacon History Contract](https://github.com/onflow/flow-core-contracts/blob/master/contracts/RandomBeaconHistory.cdc)

> Nov 1st, 2023

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/master/contracts/RandomBeaconHistory.cdc

## 

Arguments generated using:
```
cd transactions/deploy-contract/2023/nov-1

wget https://raw.githubusercontent.com/onflow/flow-core-contracts/master/contracts/RandomBeaconHistory.cdc

To generates hex encoded contract cdc 

cat "./RandomBeaconHistory.cdc" | xxd -p | tr -d '\n'
```

Arguments verified using:
```
$ cat arguments.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt ./RandomBeaconHistory.cdc
(Should produce no difference)
```

# Multi-sign setup
https://flow-multisig-git-service-account-onflow.vercel.app/mainnet/oauth/9287a82f9e7302622a4ef26f4334a314acda333814efcc28718af756eabf1cb7

## Fallback method

## Flow team builds

```sh
flow transactions build ./templates/deploy_contract.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/deploy-contract/2023/nov-1/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-unsigned.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-unsigned.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-1.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-1.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-2.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-2.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-3.rlp
```

## Sean Signs

```sh
flow transactions sign ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-3.rlp \
  --config-path flow.json \
  --signer sean \
  --filter payload \
  --save ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/deploy-contract/2023/nov-1/flow-contract-random-beacon-history-deployment-nov-1-sig-complete.rlp
```


## Results


https://www.flowdiver.io/tx/043b3db37264d5def3e220c30faedae982074634311a6feeeb3cf92b50be7abc
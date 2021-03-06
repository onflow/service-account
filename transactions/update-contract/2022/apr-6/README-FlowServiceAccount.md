# Update Service Account Contract

> April 6th, 2022

## Contract to be deployed

https://raw.githubusercontent.com/onflow/flow-core-contracts/6a08d8c6bf660ed72d3ba10c8e1134b6cbfcf750/contracts/FlowServiceAccount.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/apr-6/arguments-flow-service-account.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-apr-6-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-apr-6-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-1.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2022/apr-6/update-contract-apr-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/78b201187abc3423a4ef18f76b13c343ba9b212a60b96a1428b0fc8c7f33ac0b

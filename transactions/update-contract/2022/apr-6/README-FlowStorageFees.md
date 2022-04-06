# Update Flow Storage Fees Contract

> April 6th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/505183115d4e8596876267ae3a1db297e182f4d7/contracts/FlowStorageFees.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/apr-6/arguments-flow-storage-fees.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-1.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2022/apr-6/update-contract-flow-storage-fees-apr-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

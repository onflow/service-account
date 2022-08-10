# Update Flow Cluster QC Contract

> 2022 aug-9

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/797b149ceaaa/contracts/FlowStorageFees.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/aug-9/arguments-update-contract-FlowStorageFees.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 0 \
  --authorizer 0xe467b9dd11fa00df \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-unsigned.rlp
```

## TODO Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-unsigned.rlp \
  --config-path flow.json \
  --signer TODO \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-sig-1.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/update-contract/2022/aug-9/update-contract-FlowStorageFees-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
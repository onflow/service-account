# Update Flow Cluster QC Contract

> 2022 aug-18

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/797b149ceaaa/contracts/epochs/FlowClusterQC.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/aug-18/arguments-update-contract-FlowClusterQC.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-unsigned.rlp
```

## TODO Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-unsigned.rlp \
  --config-path flow.json \
  --signer TODO \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-sig-1.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/update-contract/2022/aug-18/update-contract-FlowClusterQC-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
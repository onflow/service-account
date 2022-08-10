# Update Flow Cluster QC Contract

> 2022 aug-9

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/797b149ceaaa/contracts/StakingProxy.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/aug-9/arguments-update-contract-StakingProxy.json")" \
  --proposer 0x62430cf28c26d095 \
  --proposer-key-index 0 \
  --authorizer 0x62430cf28c26d095 \
  --authorizer 0x62430cf28c26d095 \
  --payer 0x62430cf28c26d095 \
  -x payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-unsigned.rlp
```

## TODO Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-unsigned.rlp \
  --config-path flow.json \
  --signer TODO \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-sig-1.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/update-contract/2022/aug-9/update-contract-StakingProxy-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
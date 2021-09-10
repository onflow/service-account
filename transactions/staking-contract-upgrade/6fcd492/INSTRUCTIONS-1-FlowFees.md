# Update Service Account Contract

> September 10, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/tree/lib/go/templates/6fcd492/contracts

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/6fcd492/flow-fees-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0xf919ee77447b7497 \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-unsigned.rlp
```

## Flow Fees signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-unsigned.rlp \
  --config-path flow-staking.json \
  --signer flow-fees \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-sig-1.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/6fcd492/flow-fees-contract-upgrade-6fcd492-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

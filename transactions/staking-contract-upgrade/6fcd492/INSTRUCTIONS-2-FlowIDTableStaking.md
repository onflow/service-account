# Update Service Account Contract

> September 10, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/tree/lib/go/templates/v0.7.7/contracts/epochs

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/6fcd492/flow-id-table-staking-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-3.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-3.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/6fcd492/staking-contract-upgrade-6fcd492-sig-complete.rlp
```

## Results

Attempt 1 - Failed: https://flowscan.org/transaction/0ca52c2037c2f8bef3dac36bbcd1bb12f02ca55a7dd7ee7b588a2fd0dd3f8895

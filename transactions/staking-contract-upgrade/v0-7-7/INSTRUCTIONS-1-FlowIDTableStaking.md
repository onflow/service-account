# Update Service Account Contract

> August 19, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/tree/lib/go/templates/v0.7.7/contracts/epochs

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/v0-7-7/flow-id-table-staking-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/v0-7-7/staking-contract-upgrade-v0-7-7-sig-complete.rlp
```

## Results

Attempt 1 - Failed: https://flowscan.org/transaction/7a5da9a326e5d5cb41ceb929dd6c60968a5a03367d858b7f87d4356f2348bca1
https://flowscan.org/transaction/9364df770b941d34060b022215409521557a8e8fa2721b1a28f84affd066b1c2

# Update Staking Contract

> October 5, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/8b3f2765b72e887c833e33baea4dfe0e5225efd1/contracts/FlowIDTableStaking.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/8b3f276/flow-id-table-staking-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/8b3f276/staking-contract-upgrade-8b3f276-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

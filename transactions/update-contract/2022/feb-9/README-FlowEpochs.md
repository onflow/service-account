# Update Flow Epoch Contract

> February 9th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/e2f28762f87896428ffb1f385296c3a3c286852d/contracts/epochs/FlowEpoch.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/feb-9/arguments-flow-epochs.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2022/feb-9/flow-epoch-contract-upgrade-feb-9-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/0ea0f7eea5669d38f572f9e3720d203cec7b4a1ca97abb2c2ade6ba929c72ec3

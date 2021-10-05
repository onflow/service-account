# Update Flow Epoch Contract

> October 5th, 2021

## Contract to be deployed

https://raw.githubusercontent.com/onflow/flow-core-contracts/master/contracts/epochs/FlowEpoch.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/136d1f9/flow-epoch-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json  --network mainnet ./transactions/staking-contract-upgrade/136d1f9/flow-epoch-contract-upgrade-136d1f9-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/3034ea6b449edd9ab83eeabfa6485225fa9319606c363fef93f95a5ee80f10c7

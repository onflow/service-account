# Update Locked Tokens Contract

> September 27, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/51b4191/contracts/LockedTokens.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/staking-contract-upgrade/51b4191/flow-locked-tokens-arguments.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8d0e87b65159ae63 \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-unsigned.rlp
```

## Locked Token signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-unsigned.rlp \
  --config-path flow-staking.json \
  --signer locked-token \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-sig-1.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/staking-contract-upgrade/51b4191/locked-tokens-contract-upgrade-51b4191-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/6ec6c0e15ed0ddeb7dbf513b58df30f4dc8548a3f14e01f0ff79e0979bc9ac10

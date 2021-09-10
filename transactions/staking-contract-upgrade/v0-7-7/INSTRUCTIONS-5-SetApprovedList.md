# Update Service Account Contract

> August 19, 2021

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/tree/lib/go/templates/v0.7.7/contracts/epochs

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/staking-contract-upgrade/v0-7-7/set-approved-list-v0-7-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/43a4701ef562eeaf3a2aad47795f4b8492023b72f51a5146c90f3e82e839c68a

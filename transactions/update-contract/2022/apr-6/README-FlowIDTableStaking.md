# Update Flow ID Table Staking Contract

> April 6th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/26afc84a19039ae7e6628b4bc4b4f53083be4abc/contracts/FlowIDTableStaking.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/apr-6/arguments-flow-id-table-staking.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-4.rlp \
  --config-path flow-staking.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2022/apr-6/flow-id-table-staking-contract-upgrade-apr-6-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/

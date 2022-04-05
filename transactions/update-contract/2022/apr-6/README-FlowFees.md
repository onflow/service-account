# Update Flow Fees Contract

> April 6th, 2022

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/blob/6a08d8c6bf660ed72d3ba10c8e1134b6cbfcf750/contracts/FlowFees.cdc

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract_admin.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/apr-6/arguments-flow-dkg.json")" \
  --proposer 0x8d0f8df62029f75a \
  --proposer-key-index 0 \
  --authorizer 0xf919ee77447b7497 \
  --authorizer 0x8d0f8df62029f75a \
  --payer 0x8d0f8df62029f75a \
  -x payload \
  --save ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-unsigned.rlp
```

## Fees Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-sig-3.rlp \
  --config-path flow.json \
  --signer fees \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-sig-4.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-sig-4.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2022/apr-6/flow-dkg-contract-upgrade-apr-6-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/

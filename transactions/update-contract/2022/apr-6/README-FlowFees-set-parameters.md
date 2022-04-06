# Run Flow Fees parameters

> April 6th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_tx_fee_parameters.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/apr-6/arguments-flow-tx-fee-parameters.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 11 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/update-contract/2022/apr-6/set-tx-fee-parameters-apr-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

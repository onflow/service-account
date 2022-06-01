# Run Flow Fees parameters

> June 1st, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_tx_fee_parameters.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-effort-weights/2022/jun-1/arguments-flow-tx-fee-parameters.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow-staking.json --network mainnet ./transactions/set-execution-effort-weights/2022/jun-1/set-tx-fee-parameters-jun-1-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/cc6fdc3847de02414ce6f4ac944e3fb6c99b2dec2073f5d3f23da42a4ef36dd2

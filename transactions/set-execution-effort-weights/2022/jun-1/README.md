# Set Execution Effort Weights

> June 1st, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_effort_weights.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-effort-weights/2022/jun-1/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-execution-effort-weights/2022/jun-1/set-execution-effort-weights-jun-1-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

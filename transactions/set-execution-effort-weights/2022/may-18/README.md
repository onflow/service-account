# Set Execution Effort Weights

> May 18th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_effort_weights.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-effort-weights/2022/may-18/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-execution-effort-weights/2022/may-18/set-execution-effort-weights-may-18-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

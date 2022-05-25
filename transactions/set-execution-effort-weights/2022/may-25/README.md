# Set Execution Effort Weights

> May 18th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_effort_weights.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-effort-weights/2022/may-25/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 11 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-2.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-2.rlp \
  --signer find \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-execution-effort-weights/2022/may-25/set-execution-effort-weights-may-25-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

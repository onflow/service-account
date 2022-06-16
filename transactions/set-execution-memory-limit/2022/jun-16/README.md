# Set Execution Memory Limits

> June 16th, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_memory_limit.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-memory-limit/2022/jun-16/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-execution-memory-limit/2022/jun-16/set-execution-memory-limit-jun-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

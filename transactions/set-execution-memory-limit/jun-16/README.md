# Set Execution Memory Limit

> June 16th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_memory_limit.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-memory-limit/jun-16/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-unsigned.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-unsigned.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-1.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-2.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-3.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow.json ./transactions/set-execution-memory-limit/jun-16/set-execution-memory-limit-jun-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

# Set Execution Memory Limits

> June 22nd, 2022


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_execution_memory_limit.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-execution-memory-limit/2022/jun-22/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-execution-memory-limit/2022/jun-22/set-execution-memory-limit-jun-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

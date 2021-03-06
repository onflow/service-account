# Reset Epoch

> June 16th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch_with_end_staking_auction.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/2022/jun-16/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-unsigned.rlp
```

## Staking Account

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-unsigned.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-2.rlp
```
## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-4.rlp
```

---

## Service Account
## Find Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-4.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-5.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-5.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-6.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-6.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-7.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-7.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/reset-epoch/2022/jun-16/reset-epoch-jun-16-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/c20eb231745d5c8da2f66fc79b0169deab66107132b1ba7b3a7f4789b31028f7

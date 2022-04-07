# Reset Epoch

> April 7th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch_with_end_staking_auction.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/2022/apr-7/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-unsigned.rlp
```

## Staking Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-4.rlp
```

---

## Service Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-4.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-5.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-5.rlp \
  --config-path flow.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-6.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-6.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-7.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-7.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/reset-epoch/2022/apr-7/reset-epoch-apr-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/a9d0ceb9382a067669f31a6104ec98a71f17200a6fe3957ceb18e8ebf59a56a1

# Reset Epoch

> Nov 3rd, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch_with_end_staking_auction.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/2022/nov-3/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-unsigned.rlp
```

## Staking Account

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-unsigned.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-1.rlp \
  --config-path flow-staking.json \
  --signer flowscan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-2.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-2.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-4.rlp
```

---

## Service Account
## Flowscan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-4.rlp \
  --config-path flow.json \
  --signer flowscan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-5.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-5.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-6.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-6.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-7.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/



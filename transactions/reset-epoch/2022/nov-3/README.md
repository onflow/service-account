# Reset Epoch

> Nov 3rd, 2022

Sequence of signing: 
1. Paul generates the Tx
2. Round one - 
   1. XXX signs with flow-staking.json
   2. Peter Signs with flow-staking.json
   3. Vishal Signs with flow-staking.json
   4. Paul Signs with flow-staking.json
3. Roune two -
   1. XXX signs with flow.json
   2. Peter Signs with flow.json
   3. Vishal Signs with flow.json
   4. Paul Signs with flow.json
4. Paul submits

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

## XXX Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-unsigned.rlp \
  --config-path flow-staking.json \
  --signer XXX \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-1.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-1.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-2.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-2.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-3.rlp
```

## Paul Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-3.rlp \
  --config-path flow-staking.json \
  --signer paul \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-4.rlp
```

---

## Service Account
## XXX Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-4.rlp \
  --config-path flow.json \
  --signer XXX \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-5.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-5.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-6.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-6.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-7.rlp
```

## Paul Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-7.rlp \
  --config-path flow.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/reset-epoch/2022/nov-3/reset-epoch-nov-3-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/e28f75b428dcf37d68b7a5a4f45bd61264685f1be5b7bbaea39500c4da257cce

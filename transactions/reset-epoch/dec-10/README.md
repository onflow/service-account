# Reset Epoch

> December 10th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch_with_end_staking_auction.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/dec-10/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-unsigned.rlp
```

## Staking Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-1.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-4.rlp
```

---

## Service Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-4.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-5.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-5.rlp \
  --config-path flow.json \
  --signer layne \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-6.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-6.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-7.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-7.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/reset-epoch/dec-10/reset-epoch-dec-10-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f7b8abc188bbcab32987ba0370f6b9ee5ab902a3ad7f2de66ba0824a715bf7f3
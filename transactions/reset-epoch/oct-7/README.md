# Reset Epoch

> October 7th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/oct-7/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-complete.rlp
```

## Results

Attempt 1 - Failed: https://flowscan.org/transaction/394029380eca26bb1b760fcbdb6413f9f9693b61798a35be33d17b0c7d4d692c
https://flowscan.org/transaction/

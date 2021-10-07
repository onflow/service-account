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
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-unsigned.rlp
```

## Staking Account
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
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-4.rlp
```

---

## Service Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-4.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-5.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-5.rlp \
  --config-path flow.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-6.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-6.rlp \
  --config-path flow.json \
  --signer layne \
  --filter payload \
  --save ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-7.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/oct-7/reset-epoch-oct-7-sig-7.rlp \
  --config-path flow.json \
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
Attempt 2 - Didn't complete
Attempt 3 - Didn't complete
Attempt 4 - Failed: https://flowscan.org/transaction/f82e885ee172202dc94e514ff9a3fc4fa5e2a00c815442ed9f74a55da25969aa
Attempt 5 - : https://flowscan.org/transaction/308470f3325c8e4fb38808b4eff3736655c97f8df1025862b6b9d84d81a2d42d

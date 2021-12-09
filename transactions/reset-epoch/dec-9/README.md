# Reset Epoch

> December 9th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/dec-9/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-unsigned.rlp
```

## Staking Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-4.rlp
```

---

## Service Account
## Blocto Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-4.rlp \
  --config-path flow.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-5.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-5.rlp \
  --config-path flow.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-6.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-6.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-7.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-7.rlp \
  --config-path flow.json \
  --signer kan \
  --filter payload \
  --save ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/reset-epoch/dec-9/reset-epoch-dec-9-sig-complete.rlp
```

## Results

Failed - https://flowscan.org/transaction/4d8ba33524360a187f8f2ba5ebca6194735a78760fbac6668bba050662abd78e

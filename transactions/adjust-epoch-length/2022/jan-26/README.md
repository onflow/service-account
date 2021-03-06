# Adjust Epoch Length

> January 26th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/2022/jan-26/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-unsigned.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-unsigned.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2022/jan-26/adjust-epoch-length-jan-26-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/1bb513bd3fead5150be730969161d9f7d30a0a04b7d464dc38f517cd85b01239

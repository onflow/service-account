# Adjust Epoch Length

> March 30th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/2022/mar-30/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2022/mar-30/adjust-epoch-length-mar-30-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/707b422aa5a458097c3462b9ace4bf6c0a4f855a49ca660a469390ce25b1329e

# Adjust Epoch Length

> March 29th, 2023

## Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length_v2.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/2023/mar-29/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-mar-29-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-mar-29-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-26/adjust-epoch-length-apr-26-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-apr-26-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2023/mar-29/adjust-epoch-length-mar-29-sig-complete.rlp
```

## Results

<<TODO transaction ID and link>>
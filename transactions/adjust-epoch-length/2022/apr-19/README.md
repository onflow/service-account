# Adjust Epoch Length

> April 19th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length_v2.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/2022/apr-19/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-unsigned.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-1.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2022/apr-19/adjust-epoch-length-apr-19-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

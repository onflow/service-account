# Adjust Epoch Length

> March 30th, 2023

[site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=adjust_epoch_length_v2.cdc&param=%5B%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%222000%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%22460000%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%22483000%22%20%09%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999)

## Fallback (if signing using the site does not work)
### Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length_v2.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/2023/mar-30/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-mar-30-unsigned.rlp
```

## Justin Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-mar-30-unsigned.rlp \
  --config-path flow-staking.json \
  --signer justin \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-1.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-1.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-2.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-2.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/2022/apr-26/adjust-epoch-length-apr-26-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-apr-26-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-mar-30-sig-complete.rlp
```

## Results

<<TODO transaction ID and link>>
# Set Approved Node Operators ID List

> May 11th, 2022

2 new Access nodes - Binance
2 new Access nodes - Coinbase


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_approved_id_list_with_args.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/may-11/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/may-11/set-approved-list-may-11-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/2741f6667906a0d3231f81ecf13adb5307a5789ab7b7a29589b1b8a32c7b0c25

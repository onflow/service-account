# Set Approved Node Operators ID List

> April 13th, 2022

2 new Access nodes - Bison Trails
1 new Access nodes - ZB Exchange
1 new Access nodes - BCTEX


## Dapper Labs Builds

```sh
flow transactions build ./templates/set_approved_id_list_with_args.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/apr-13/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/apr-13/set-approved-list-apr-13-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/d11368236fdfb08c5f77f7a8893cd5f49d63c4d7111bd0a72bc33489a483a526

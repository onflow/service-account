# Add Approved Node Operators ID List

> June 8th, 2022

2 new external access node - Binance


## Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/june-8/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-2.rlp
```

## Find Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/june-8/add-approved-list-june-8-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
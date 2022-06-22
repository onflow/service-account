# Add Approved Node Operators ID List

> June 22nd, 2022

1 new external access node - Bitget

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/june-22/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-unsigned.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-1.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/june-22/add-approved-list-june-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/9d004012b8c89d449eb4dd5205007da46cfa076b64b26af8d49798788ec2317d
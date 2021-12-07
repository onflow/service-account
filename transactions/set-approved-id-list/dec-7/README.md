# Add Approved Node Operators ID List

> December 7th, 2021

13 new external access nodes

1 new Dapper Labs access node

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/dec-7/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/dec-7/set-approved-list-dec-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/0cc9dd5a488872f34e5f908b968cc0d2a2f902877d9a6a0ca307c9d2345c40bc

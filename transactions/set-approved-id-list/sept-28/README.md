# Set Approved Node Operators ID List

> September 28, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_approved_id_list_with_args.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/sept-28/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/sept-28/set-approved-list-sept-28-sig-complete.rlp
```

## Results

Attempt 1 - Failed: https://flowscan.org/transaction/0efdf4e555708485b783f7a6d34e1685817899c7ec42deca7f7e703f405a2c47

https://flowscan.org/transaction/9fce5b4940b8ef09bdaa925179c6f87c5a9dc8521ad78f0341d229f22d84ee23

# Add Approved Node Operators ID List

> June 15th, 2022

1 new external access node - Coinbase Cloud
1 new external access node - Increment.fi
4 new external access node - Circle

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/june-15/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-1.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-1.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/june-15/add-approved-list-june-15-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
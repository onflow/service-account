# Add Approved Node Operators ID List

> June 1st, 2022

1 new external access node - NFTKred


## Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/june-1/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-unsigned.rlp \
  --config-path flow-staking.json \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-1.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/june-1/add-approved-list-june-1-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/17e01da67a05757741f00b507dee7728baf18bf185ee3312691041d484e11652

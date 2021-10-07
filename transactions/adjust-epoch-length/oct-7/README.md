# Adjust Epoch Length

> October 7th, 2021

## Dapper Labs Builds

```sh
flow transactions build ./templates/adjust_epoch_length.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/adjust-epoch-length/oct-7/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-unsigned.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-2.rlp \
  --config-path flow-staking.json \
  --signer layne \
  --filter payload \
  --save ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/oct-7/set-approved-list-oct-7-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

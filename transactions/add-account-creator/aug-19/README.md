# Add account creation privileges

> August 18, 2021

## Addresses in arguments, and their owners

- `0x576e6bf10198583e` (Wyre, Inc)
- `0xbccf7298185fd0c4` (Study Exchange)

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/aug-18/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/aug-18/add-account-creator-aug-18-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

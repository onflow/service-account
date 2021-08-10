# Add account creation privileges

> August 10, 2021

## Addresses in arguments, and their owners

- `0x9b00972a3ecb364b` - Tibles
- `0x1c7acdf4bdc4db29` - Dime

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/aug-10/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/aug-10/add-account-creator-aug-10-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

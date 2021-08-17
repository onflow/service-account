# Add account creation privileges

> August 17, 2021

## Addresses in arguments, and their owners

- `0x8f4f599546e2d7eb` (24Karat)
- `0x61d5d84225718c45` (NFTco)
- `0x5230bbe48aaa0104` (Peek Social)

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/aug-17/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/aug-17/add-account-creator-aug-17-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

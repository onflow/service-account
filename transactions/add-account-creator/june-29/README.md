# Add account creation privileges

> June 29, 2021

## Addresses in arguments, and their owners

`0xbd136183c0dbd1ef` - OKEx (Account 3)
`0x525eeac71da4af19` - Anchorage

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/june-29/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/june-29/add-account-creator-june-29-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-29/add-account-creator-june-29-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/june-29/add-account-creator-june-29-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/84fe47400b35081070bb2d43465fca2a0b37822d56abf361ae438001dd5ae4f3

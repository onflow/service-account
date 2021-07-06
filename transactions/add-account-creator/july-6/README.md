# Add account creation privileges

> July 6, 2021

## Addresses in arguments, and their owners

`0x65d58c6e7e119d43` - Binance (Account 1)
`0x9e06eebf494e2d78` - Binance (Account 2)
`0x72e4af0ede83ad84` - Anchorage (Account 2)

## Dapper Labs Builds 

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/july-6/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/july-6/add-account-creator-july-6-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-6/add-account-creator-july-6-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/july-6/add-account-creator-july-6-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

# Add account creation privileges

> July 27, 2021

## Addresses in arguments, and their owners

- `0x049de2286e2c9660` - Paprika
- `0xb3e32b5028f15b1b` - Bittrex

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/july-27/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/july-27/add-account-creator-july-27-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-27/add-account-creator-july-27-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/july-27/add-account-creator-july-27-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/6d5ab459ef94719de9f967971c4fac51f25ae1a0dff5c9fe22c0ab49932bf9b8

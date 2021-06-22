# Add account creation privileges

> June 22, 2021

## Addresses in arguments, and their owners

`0x23616021c4325c0c` - ZB.com
`0x76ea6070f110806c` - CYBAVO

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/june-22/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/june-22/add-account-creator-june-22-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-22/add-account-creator-june-22-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/june-22/add-account-creator-june-22-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

# Add account creation privelages
> June 1, 2021

## Addresses in Arguments, and their Owners
`0x19f550fddc885e0d` - Finoa
`0x8d0f8df62029f75a` - Flow Contract Admin
`0x202be4fdad6a431e` - Temp 1
`0x38c0aa1b1eaa65cc` - Temp 2
`0xcaf376f596546f72` - Temp 3
`0xc1d9446c5ad1115b` - Temp 4
`0x25befdb14b2b1184` - Temp 5

## Dapper Labs Builds

```sh
flow transactions build ./../add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/june-1/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-1.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-1.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-2.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-3.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-3.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-4.rlp
```

---

# If Needed


## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-4.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-complete.rlp
```

## Alex Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-3.rlp \
  --signer alex \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-4.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/june-1/add-account-creator-june-1-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/9b0e38d3b1fba1194e6d4bb441e095013ab9c2a634f9d18d7250a7e4f62a620d

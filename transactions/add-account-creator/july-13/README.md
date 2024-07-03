# Add account creation privileges

> July 13, 2021

## Addresses in arguments, and their owners

`0x71824b081831d731` - AEX (Account 1)
`0x83b197e690cfdd8f` - AEX (Account 2)
`0x146d96afde0867b0` - Subs.tv

## Dapper Labs Builds 

```sh
flow transactions build ./../add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/july-13/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/july-13/add-account-creator-july-13-unsigned.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-13/add-account-creator-july-13-unsigned.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-1.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-1.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/july-13/add-account-creator-july-13-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/8259cfa625df24b2cb00f00d0b92455eff08b1f369413a75de2b69e1217d3578

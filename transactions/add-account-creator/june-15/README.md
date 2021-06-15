# Add account creation privelages
> June 15, 2021

## Addresses in Arguments, and their Owners
`0x354e6721564ccd2c` - Tatum.io - https://flow-view-source.com/mainnet/account/0x354e6721564ccd2c/contract/TatumMultiNFT

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_account_creator.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-account-creator/june-15/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 13 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-account-creator/june-15/add-account-creator-june-15-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-15/add-account-creator-june-15-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-account-creator/june-15/add-account-creator-june-15-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

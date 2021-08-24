# Set account creation restriction

> August 24, 2021

Setting to `false`

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_is_account_creation_restricted.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-account-creation-restriction/aug-24/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-unsigned.rlp
```

## Equilibrium Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-unsigned.rlp \
  --signer equilibrium \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-1.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-1.rlp \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-account-creation-restriction/aug-24/set-account-creation-restriction-aug-24-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

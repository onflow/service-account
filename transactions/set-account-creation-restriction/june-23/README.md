# Set account creation restriction

> June 23, 2021

Setting to `true`

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_is_account_creation_restricted.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-account-creation-restriction/june-23/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-1.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-1.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-2.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-2.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-3.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-3.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-account-creation-restriction/june-23/set-account-creation-restriction-june-23-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

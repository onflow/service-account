# Add Service Account Signing privileges

> May 11th, 2022

## Public Keys in arguments, and their owners

- Key to be Replaced:
- `ebf2a717ffb63fd9aab2c161c5988347f98f75f7cdc853f30c85c1b697b1224aad7c3ada89e2c0f5797e549bc86834d7a4e0ce3ca4e300c780bb5d81d32953da` - Encoded (Sig: ECDSA_P256, Hash: SHA3_256, Weight: 250, Index: 14): `f846b840ebf2a717ffb63fd9aab2c161c5988347f98f75f7cdc853f30c85c1b697b1224aad7c3ada89e2c0f5797e549bc86834d7a4e0ce3ca4e300c780bb5d81d32953da020381fa`- Bjarte

Key to be added:
- `708c3b36830e9d8dcfac9536fcec3df02fc24b82fbb793d5e3206c64ded49f8e11bcf2aa535b2c2f8e6ace17b6f3c8c6edd0d041222023e8e4b0729b07726b74` - Encoded (Sig: ECDSA_P256, Hash: SHA2_256, Weight: 250): `f846b840708c3b36830e9d8dcfac9536fcec3df02fc24b82fbb793d5e3206c64ded49f8e11bcf2aa535b2c2f8e6ace17b6f3c8c6edd0d041222023e8e4b0729b07726b74020181fa`- Bjarte

## Dapper Labs Builds

```sh
flow transactions build ./templates/replace_key.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-keys/2022/may-11/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2022/may-11/add-keys-may-11-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-keys/2022/may-11/add-keys-may-11-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-keys/2022/may-11/add-keys-may-11-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

# Add Service Account Signing privileges

> April 26th, 2022

## Public Keys in arguments, and their owners

- `ebf2a717ffb63fd9aab2c161c5988347f98f75f7cdc853f30c85c1b697b1224aad7c3ada89e2c0f5797e549bc86834d7a4e0ce3ca4e300c780bb5d81d32953da` - Encoded (Sig: ECDSA_P256, Hash: SHA3_256, Weight: 250): `f846b840ebf2a717ffb63fd9aab2c161c5988347f98f75f7cdc853f30c85c1b697b1224aad7c3ada89e2c0f5797e549bc86834d7a4e0ce3ca4e300c780bb5d81d32953da020381fa`- Bjarte
- `fda3f37f8289bbc26c3bd817034726fa3c23eb8d9420c4ac1eef808dd0ce9056b66d0ef022ff00501e9a78e72a6322356db494dcacfcdc3a270ee3110adf0d8b` - Encoded (Sig: ECDSA_P256, Hash: SHA2_256, Weight: 250): `f846b840fda3f37f8289bbc26c3bd817034726fa3c23eb8d9420c4ac1eef808dd0ce9056b66d0ef022ff00501e9a78e72a6322356db494dcacfcdc3a270ee3110adf0d8b020181fa` - Jonathan


## Dapper Labs Builds

```sh
flow transactions build ./templates/add_keys.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/add-keys/2022/apr-26/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2022/apr-26/add-keys-apr-26-unsigned.rlp
```

## Blocto Signs

```sh
flow transactions sign ./transactions/add-keys/2022/apr-26/add-keys-apr-26-unsigned.rlp \
  --signer blocto \
  --filter payload \
  --save ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-keys/2022/apr-26/add-keys-apr-26-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

# Add Staking Account Signing privileges

> July 27th, 2022

## Public Keys in arguments, and their owners

- `708c3b36830e9d8dcfac9536fcec3df02fc24b82fbb793d5e3206c64ded49f8e11bcf2aa535b2c2f8e6ace17b6f3c8c6edd0d041222023e8e4b0729b07726b74` - Encoded (Sig: ECDSA_P256, Hash: SHA3_256, Weight: 250): `f846b840708c3b36830e9d8dcfac9536fcec3df02fc24b82fbb793d5e3206c64ded49f8e11bcf2aa535b2c2f8e6ace17b6f3c8c6edd0d041222023e8e4b0729b07726b74020181fa`- Bjarte

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_keys.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/add-keys/2022/jul-27/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 500000 \
  -x payload \
  --save ./transactions/add-keys/2022/jul-27/add-keys-jul-27-unsigned.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/add-keys/2022/jul-27/add-keys-jul-27-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-2.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-3.rlp
```

## Paul Signs

```sh
flow transactions sign ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-3.rlp \
  --config-path flow-staking.json \
  --signer paul \
  --filter payload \
  --save ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-keys/2022/jul-27/add-keys-jul-27-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f88b0a3c7204d7f14b25af52f6ca33e3911b9395df2d11680a1eaefb2d96c51a

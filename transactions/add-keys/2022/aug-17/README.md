# Add Service Staking Account and Staking account Signing privileges

> Aug 17th, 2022

## Public Keys in arguments, and their owners

- `ee4aec89e6d83fe563ee93de01374961fcf117b7e746c78b3097f54b630a053fd4ee70a4bde974ce12d71deb444c5c23c224ad92f05a6f72b54742fd9700a3b7` - Encoded (Sig: ECDSA_P256, Hash: SHA3_256, Weight: 250): `f846b840ee4aec89e6d83fe563ee93de01374961fcf117b7e746c78b3097f54b630a053fd4ee70a4bde974ce12d71deb444c5c23c224ad92f05a6f72b54742fd9700a3b7020181fa`- Jonathan


## Adding key to the Service account
[Transaction url](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_keys.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22f846b840ee4aec89e6d83fe563ee93de01374961fcf117b7e746c78b3097f54b630a053fd4ee70a4bde974ce12d71deb444c5c23c224ad92f05a6f72b54742fd9700a3b7020181fa%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=e467b9dd11fa00df&limit=9999)

## Adding key to the Staking account
[Transaction url](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_keys.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22f846b840ee4aec89e6d83fe563ee93de01374961fcf117b7e746c78b3097f54b630a053fd4ee70a4bde974ce12d71deb444c5c23c224ad92f05a6f72b54742fd9700a3b7020181fa%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=8624b52f9ddcd04a&limit=9999)


## Fall back

## Dapper Labs Builds

```sh
flow transactions build ./templates/add_keys.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/add-keys/2022/aug-17/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 9999 \
  -x payload \
  --save ./transactions/add-keys/2022/aug-17/add-keys-aug-17-unsigned.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/add-keys/2022/aug-17/add-keys-aug-17-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-2.rlp
```

## Ichi Signs

```sh
flow transactions sign ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-2.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-3.rlp
```

## Paul Signs

```sh
flow transactions sign ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-3.rlp \
  --config-path flow-staking.json \
  --signer paul \
  --filter payload \
  --save ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-complete.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/add-keys/2022/aug-17/add-keys-aug-17-sig-complete.rlp
```

## Results


1. https://flowscan.org/transaction/8dcf9b01c9089dd26642da2e41184fb5295a64d20af53789ba572084deb9c0f5
2. https://flowscan.org/transaction/8ed08f99e2f98573d53958f343469d4688f93c6f885f6e01f275e82f07d9841d
# Add Approved Node Operators ID List

> Nov 2nd, 2022

1. One Verification node - Lilco (Node ID: 3c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1)
2. Two Access nodes - Huobi (Node ID: 8c85f3d48e8c4db4881869a67543f6002c2f14eca9519fecc6860043bbc4df14 and d343c1f8579bc26eb58e42fae2ae945fe45ea3437e41b0138258a756ad4626d1)
3. One Verification node - Binance (Node ID: 7c589e6cc38508b27545d052073ab3aa84a35425bd2881205d778cca95f10a7b)
4. Two Access Nodes - BTCTrader (Node ID: 16caf1edab4c8e92068f5d1f5639180ecd361795ee4f8709f5f931f6289aa939 and 7dedc9c3af28387bf6741b851830c6afc607a01547a4342b6d0f76638ef5d7f9)

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%223c6519ba8be35e338df7273a895ad3abaeb0c232eb908ee7b05462018c112fe1%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%228c85f3d48e8c4db4881869a67543f6002c2f14eca9519fecc6860043bbc4df14%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22d343c1f8579bc26eb58e42fae2ae945fe45ea3437e41b0138258a756ad4626d1%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%227c589e6cc38508b27545d052073ab3aa84a35425bd2881205d778cca95f10a7b%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%2216caf1edab4c8e92068f5d1f5639180ecd361795ee4f8709f5f931f6289aa939%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%227dedc9c3af28387bf6741b851830c6afc607a01547a4342b6d0f76638ef5d7f9%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/nov-2/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/nov-2/add-approved-list-nov-2-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/a204e5abbacee6f9c3ddad36e5733df1c4a831f0f43f9e9587027b205916a705

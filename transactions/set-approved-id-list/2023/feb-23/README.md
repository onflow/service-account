# Add Approved Node Operators ID List

> Feb 23rd, 2023
Two Consensus node - BlockDaemon (Node IDs: 5a4bff17941a73909472afe23f1ccdc59d7526f93b16b4e374bd8353f8b624b4 & d98755f4ae8bef3f372889c4d7010ca784ea6da46fdde63d27ee57b2bf5efdd7)

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%225a4bff17941a73909472afe23f1ccdc59d7526f93b16b4e374bd8353f8b624b4%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2023/jan-25/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-unsigned.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-1.rlp
```

### Emerson Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-2.rlp
```

### Justin Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-2.rlp \
  --config-path flow-staking.json \
  --signer justin \
  --filter payload \
  --save ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-3.rlp
```

### Josh Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-3.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-complete.rlp
```

### Kan Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2023/jan-25/add-approved-list-jan-25-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

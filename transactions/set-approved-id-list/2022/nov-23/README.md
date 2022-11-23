# Add Approved Node Operators ID List

> Nov 23rd, 2022 
One verification node - Taiwan Mobile (Node ID: e8f4bd649d08ecb5afb7023a0c5e8bb10ce56659399665da8cc9d517e7982f92)

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22e8f4bd649d08ecb5afb7023a0c5e8bb10ce56659399665da8cc9d517e7982f92%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/nov-23/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/nov-23/add-approved-list-nov-23-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/82dc53a95ab3cc0783d734efc8d36a441405c214d23c64f2c76bcb0e51050166

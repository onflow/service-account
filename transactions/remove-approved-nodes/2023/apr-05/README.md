# Remove nodes from the Approved Node Operators ID List

> April 5st, 2023
Removing RIT VN node ID since they no longer wish to run the node and cannot unstake since they have lost their account keys.

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=remove_approved_nodes.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%221a671144c4e8def6ce53aa861e185ab22f559f8ba0e0ea6017b714f3b5be0d74%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `remove_approved_nodes.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/remove_approved_nodes.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/remove-approved-nodes/2023/apr-05/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/remove-approved-nodes/2023/apr-05/remove-approved-list-apr-05-sig-complete.rlp
```

## Results

Failed: https://flowscan.org/transaction/f6e2d702e916f4725800d50970bebc68645f36ca0482441a08907c51a3147f7a

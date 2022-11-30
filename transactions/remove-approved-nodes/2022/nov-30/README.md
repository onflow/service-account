# Remove nodes from the Approved Node Operators ID List

> Nov 30th, 2022 
Two Figment consensus nodes - (Node ID: 9ca5d935372cfedd722f3c02efcbb94a3ad0617211384dc213dc6737094a02ea, a05c404084c51a407c09915bdf8444786cb5b6831cbd0ac079dff2d6d196225c)
One DL consensus node - (Node ID: 0e4609ba141275b5db5902a493a2c0b82047b48dcbc15333db44542c7eb8cc8d)
Two Huobi Access nodes - (Node ID: 864f0d6d62f3385581bf7889513d0f583fee8ef4935d85d98da8db0d9edd6339,f612f908ab95e5346c4b609a0dac1ca8df7b35e7887a537c901ce5ffe26825ef)

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site]() for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/remove-approved-nodes/2022/nov-30/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/remove-approved-nodes/2022/nov-30/add-approved-list-nov-30-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

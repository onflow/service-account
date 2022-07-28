# Add Approved Node Operators ID List

> Aug 3rd, 2022

1 new external access node - Greenfield One

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/add_approved_id_list.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/set-approved-id-list/2022/aug-3/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/aug-3/add-approved-list-aug-3-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

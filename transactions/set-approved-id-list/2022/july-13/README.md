# Add Approved Node Operators ID List

> June 13th, 2022

1 new external access node - Bitget

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
  --args-json "$(cat "./transactions/set-approved-id-list/2022/july-13/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-unsigned.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-unsigned.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-1.rlp
```

### Animoca Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-1.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-2.rlp
```

### Peter Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-2.rlp \
  --config-path flow-staking.json \
  --signer peter \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-3.rlp
```

### Kan Signs

```sh
flow transactions sign ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-3.rlp \
  --config-path flow-staking.json \
  --signer kan \
  --filter payload \
  --save ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/set-approved-id-list/2022/july-13/add-approved-list-july-13-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/
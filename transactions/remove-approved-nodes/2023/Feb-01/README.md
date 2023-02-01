# Remove nodes from the Approved Node Operators ID List

> Feb 1st, 2023
Removing 17 node IDs which are in the approved list of node but are not currently staked.

## New method using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=remove_approved_nodes.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%221780288437c9aed5056836bfffcfe19334dd6e229607fccfb3fe9b1d4d24cdca%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22237a7a04ecf88b7c21001589ecc277190a6f7cd6e56a296a203552ade6db0927%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%225a4bff17941a73909472afe23f1ccdc59d7526f93b16b4e374bd8353f8b624b4%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%2294609410b05584616f628f98a26acec339f7e1ce43132f0d8d268540317023d8%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22a67ca1afd47c58358c656dffa2e5585d80b01371866e5634b68dcbab090b9b6f%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22da27c0fc2a4fe12c04bd70058252c5a26cfe41485bf6ea6aba1c724b7a07542d%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22dc3054cae816874d7dbbe838a41ef97c8a01b44643bffc82afe3a8228eed29fd%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22069d081eb931c30e73c8dfbbf6359198f48c9e650d3d25a7449267de811d4fca%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22a1fd244595bcd4371f1abc38a60384b87b25a41e806ce970ec19ea6c651f365b%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22dfe68dcea8dc6cd54b56899c8ebb1ae144edcd8f4527fe7572cf4125f4c5a7ac%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%221059d479c9ce3d6fd9cc48fca99fc5135b59e7f944c3ab14aca56b054209bf20%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%222c08e4113b88e3709e06de152b64127be20d1b2db7d6a5c018b85f131ae330b4%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%228894e0d5092ad62c5498b71b4f0680f60ba3828ace7b3329a2aeb94f2a7242fb%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%221fecd2813d2b931a7cc10efd5d0e53936e0dfb4e31d67750201c5e02dad0bdaf%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%2244b928d503a90afe50333314f8eac8dc2e3fa982bc49ba246e15bb6b0c494a31%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22dd9fa94156de9a05d6f344eb83943418ad6436d25ee26695bd7610d4d90ebaa8%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22864b8e7d8770a2342d02c251b0b5508d7795726605f9f6069237b5eb8eb1db29%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `remove_approved_nodes.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)

## Old method (Fallback)

### Dapper Labs Builds

```sh
flow transactions build ./templates/remove_approved_nodes.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/remove-approved-nodes/2023/feb-01/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  -x payload \
  --save ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-unsigned.rlp
```

### Vishal Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-1.rlp
```

### Blocto Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-1.rlp \
  --config-path flow-staking.json \
  --signer blocto \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-2.rlp
```

### Ichi Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-2.rlp \
  --config-path flow-staking.json \
  --signer Ichi \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-3.rlp
```

### Paul Signs

```sh
flow transactions sign ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-3.rlp \
  --config-path flow-staking.json \
  --signer Paul \
  --filter payload \
  --save ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/remove-approved-nodes/2023/feb-01/remove-approved-list-feb-01-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/f94f9a1d4f9cc282b9c9782cffd5e4e92c9c99fca9fc4480ff2723baf992cb0c

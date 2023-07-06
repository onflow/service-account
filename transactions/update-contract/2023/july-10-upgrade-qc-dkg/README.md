# Update QC and DKG Contracts

> July 10th, 2023

Upgrade to the QC and DKG contracts from this pull request:

- https://github.com/onflow/flow-core-contracts/pull/364

These include changes to enable moving epoch admins to the service account.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowClusterQC`.

2. Upgrade `FlowDKG`.

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-{Filename}-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt {Filename}.cdc
(Should produce no difference)
```
___

# Transaction 1

## Transaction 1 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/upgrade_contract.cdc`
Args: `arguments-update-FlowClusterQC.json`

This transaction can be executed using the web tool.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `upgrade-contract.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction


### Results

Successful attempt:
https://flowscan.org/transaction/

___

# Transaction 2

## Transaction 2 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/upgrade_contract.cdc`
Args: `arguments-update-FlowDKG.json`

This transaction can be executed using the web tool.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `upgrade-contract.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction


### Results

Successful attempt:
https://flowscan.org/transaction/

___
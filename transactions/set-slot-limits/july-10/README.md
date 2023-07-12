# Increase Access node slot limits for permissionless

> July 10th, 2023

## Transactions

1. Increase access node slot limit by 3

`templates/increase_slot_limit.cdc`
___

# Transaction 1

## Transaction 1 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/increase_slot_limit.cdc`
Args: `arguments-increase-slot-limit.json`

This transaction can be executed using the web tool.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `increase-slot-limit.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction


### Results

Successful attempt:
https://flowscan.org/transaction/1832e4519e96fa6491b72af43bebcdb67dd8f50812d080479a2ad855dfda4d6b

___
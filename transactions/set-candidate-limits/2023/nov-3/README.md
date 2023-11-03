# Increase Candidate Node Limits for all non-access node types

> November 3, 2023

## Transactions

1. Increase candidate node limits

`templates/change_candidate_limits.cdc`
___

# Transaction 1

## Transaction 1 Sequence of signing: 

Signer: Service account
Transaction: `templates/change_candidate_limits.cdc`
Args: `arguments-change-candidate-limits.json`

This transaction can be executed using the web tool.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `change_candidate_limits.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction


### Results

Successful attempt:
https://www.flowdiver.io/tx/d2280e5b989aa0884b82d6b43b288c33a581368c6f94426e8ec4fddeb9ee40cb
___
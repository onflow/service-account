# Remove nodes from the Approved Node Operators ID List

> Feb 21st, 2023

Removing CB VN node ID.
See [FLIP GOV-247: Removing Verification node a3fac321587b4835966946cf7a13d5feaeb7ca91a84c85c2d2f861c2d80513ec](https://github.com/onflow/flips/blob/main/governance/20240215-removing-decommisioned-verification-node.md)


## New method using Multisign tool

1. FF generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=remove_approved_nodes.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22a3fac321587b4835966946cf7a13d5feaeb7ca91a84c85c2d2f861c2d80513ec%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) for the `remove_approved_nodes.cdc` transaction with the given args.

2. Service account members sign and submit the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results



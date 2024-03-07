# Remove nodes from the Approved Node Operators ID List

> March 8th, 2024

Removing CB VN node ID.
See [FLIP GOV-253](https://forum.flow.com/t/flip-gov-253-removing-the-decommissioned-verification-node/5731)


## New method using Multisign tool

1. FF generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=remove_approved_nodes.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22268572e59ccc469592bb434715ac3c10649d681e6eace6fd11d00d1247ef1fdc%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) for the `remove_approved_nodes.cdc` transaction with the given args.

2. Service account members sign and submit the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

https://www.flowdiver.io/tx/
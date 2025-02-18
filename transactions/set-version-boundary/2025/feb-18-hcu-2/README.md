# Set version boundary
> Feb  18th, 2025 Second Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.38.3-rc.1`

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowscan.io/tx/ca7b13483816709bdb7f70d547d76046ccff33cbc836dd17b9d7feb212e434fa

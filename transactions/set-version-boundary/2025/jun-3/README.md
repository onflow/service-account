# Set version boundary
> June 3rd, 2025 Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.42.0-rc.2`

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowscan.io/tx/b210f03702978f4d6bc97b7128261c3c4a3f3f77f6ec7568918ed994f125cf3a

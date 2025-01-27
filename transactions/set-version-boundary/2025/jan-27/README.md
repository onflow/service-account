# Set version boundary
> Jan 27st, 2025 Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.37.26-rc.3`

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowscan.io/tx/327318d67628d2a8938d18ea9fccd488ea11e67985b45e662450361c09b25bae

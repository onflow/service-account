# Set version boundary
> Nov 21st, 2024 Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.37.22-rc.1`

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowscan.io/tx/c6f594093bb66aa8aecc102873568b59cf23b0cf2ad6d4a05bfb3c0203cdcd59

Unsuccessfull Transaction IDs  (if any): https://www.flowscan.io/tx/a0521a985ad6f813aa189ffc2b209d9e7d53e34c41bbb6ba273922a5ded7d1a8

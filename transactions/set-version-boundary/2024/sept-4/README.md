# Set version boundary
> Sept 4t, 2024 (Crescendo HCU)


This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: v0.37.11-patch.1

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowdiver.io/tx/f033454d1b362b54689d0bf69a3a97fc6ed225bc4fa201470345c8987fe19365

Unsuccessfull Transaction IDs  (if any):

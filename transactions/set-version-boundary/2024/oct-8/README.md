# Set version boundary
> Oct 8th, 2024 Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.37.17-rc.2`

## New method using Flow CLI multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Result

Transaction ID: https://www.flowdiver.io/tx/5a571c68f85cc0e312c468d9ff394523c567d7c7426da00fe9aea6ade64384ec

Unsuccessfull Transaction IDs  (if any):

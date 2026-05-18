# Set version boundary
> May 18th 2026 - Set height for Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.49.0-rc.1`

## Steps to multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result


Failed Transaction: https://www.flowscan.io/tx/b38aa43bdbd898c98428a8e675b2f559a818882712f05ed710654b5cc0251ee0?tab=script
Failed because block height was less than 1000 blocks out in the future.

Successful Transaction: https://www.flowscan.io/tx/d9bdcf844677787488acea3a0940e63b3b9d1c6cdaa49f389d9b6319845ca5ff
# Set version boundary
> April 7th 2026 - Set height for Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.48.0-rc.1`

## Steps to multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Transaction ID:

Failed transaction: https://www.flowscan.io/tx/1c3ecb3e059c62fa89044bdbffe172849e6701e7ad9089a3cf55b39f59c9d103
Failure reason: block height was less than threshold
Successful transaction: https://www.flowscan.io/tx/769f9a2b88f13efabca57c4adee93d529afdbf76dfb4c61962d462dba95d5397

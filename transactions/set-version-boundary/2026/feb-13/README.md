# Set version boundary
> Feb 13th 2026 - Set height for Height Coordinated Upgrade (HCU)

This transaction sets the height at which the height coordinated upgrade occurs on mainnet.

Version to set: `v0.46.1-rc.1`

## Steps to multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `set_version_boundary.cdc` transaction with the given args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction

## Result

Failed Transaction: https://www.stakeandeggs.wtf/tx/d5a7b9d2874e1a09a32869aa3481f71aaceea7a47e583d0822325775281b71ab - failed since block height was less than 1000 blocks in the future.
Succeeded Transaction ID:https://www.stakeandeggs.wtf/tx/b9ae8536512e2b3b2c264ddd1887f348a30d06515c38f83b568edf777e957373

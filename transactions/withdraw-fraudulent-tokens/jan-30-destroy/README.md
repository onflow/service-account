## Destroy Fraudulent Tokens

> Jan 30th, 2026

Transaction to destroy all of the fraudulent tokens that were created during the Dec 27th, 2025 hack.

Tested successfully with `templates/test_script.cdc`.

## Steps to multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `destroy-fraudulent-cadence-tokens.cdc` transaction with no args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction


## Result

Transaction 1: WETH - https://www.flowscan.io/tx/d6c36b3ffeec306e4526170a3b9d5816d92f0aeafbcef77500b578f50457949e

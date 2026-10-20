## Destroy Fraudulent Tokens

> Feb 13th, 2026

Transaction to destroy additional tokens in the service account's flowtoken vault.

Transfers 50M FLOW tokens from the service account's Flow token vault to the fraudulentFlowTokenVault and destroys the fraudulentFlowTokenVault vault effectively burning those tokens.

Tested successfully with `./test_script.cdc`.

## Steps to multi-sign

1. Flow generates the Signature Request ID on the [site](https://flow-multisig.vercel.app/mainnet) for the `destroy-fraudulent-cadence-tokens.cdc` transaction with no args.

2. Signers sign the service account key using the web tool.

3. [Site](https://flow-multisig.vercel.app/mainnet) submits the transaction


## Result

Transaction: 1dbba95678f7b61e392cb4ed3f528f187fd7c34ac749daaa01864dcc3bcfa403
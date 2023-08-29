# Increase Access node Slot Limit

> Aug 29th, 2023 

Increases the slot limit for Access nodes by 3

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_access_limits.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UInt16%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%223%22%20%20%20%20%20%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `add_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

Failed attempt: 1d068ed1b82e0edfb777b0f36a5f34e1ec79331e7f01f1b2484c8122bef75494 (failed because the stakign account was used instead of the service account)


Successful attempt: https://www.flowdiver.io/tx/cfbc7b15bfc0f269ec1d1b934cd86857686a6d82eee50645558f8b62e7d87639

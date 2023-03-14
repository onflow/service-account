# Increase Access node Slot Limit

> March 15th, 2023 

Increases the slot limit for Access nodes by 5

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UInt8%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%225%22%20%20%20%20%20%7D%20%5D&acct=8624b52f9ddcd04a&limit=9999) for the `add_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

https://flowscan.org/transaction/

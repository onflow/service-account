# Increase Access node Slot Limit

> March 15th, 2023 

Increases the slot limit for Access nodes by 5

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_access_limits.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UInt8%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%225%22%20%20%20%20%20%7D%20%5D&acct=8624b52f9ddcd04a&limit=9999) for the `add_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Failed attempt: https://flowscan.org/transaction/cf800ad347b627aaffb545ba4cf6fd5589fa3f7461f8c461c0f621e8ed7be4a6
Failed because of a Cadence error in the transaction.

Successful attempt: https://flowscan.org/transaction/d8ebb3eb3d146656d957dbfabda9d77e32c9e52eba2405326a16a41fbcc2a7c0

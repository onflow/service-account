# Increase Access node Slot Limit

> Sept 19th, 2023 

Increases the slot limit for Access nodes by 6

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_access_limits.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UInt16%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%226%22%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) for the `add_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

Successful attempt: https://www.flowdiver.io/tx/edb0ca819cff884a49e73ade4d37f5d101c73288714ddbf45103207b7e988f33


# Add Approved Node Operators and increase Access node Slot Limit

> Feb 27th, 2023 

1. Adds Two Consensus nodes for Blockdaemon, which will also automatically increase the slot limit for access nodes
`5a4bff17941a73909472afe23f1ccdc59d7526f93b16b4e374bd8353f8b624b4`

`d98755f4ae8bef3f372889c4d7010ca784ea6da46fdde63d27ee57b2bf5efdd7`

2. Increases the slot limit for Access nodes to allow the one that was removed to be staked.

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site]() for the `add_approved_id_list_and_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

Failed attempt: https://flowscan.org/transaction/5f6f9170917e0c06273056c40c4b6be1c40c751b8daec022721e70c53d4525b9
Successful attempt: https://flowscan.org/transaction/7e67dd192902dbb9f9e65a7dfcfea735137f94aec9a48899e2f8ea0abc933b8f/

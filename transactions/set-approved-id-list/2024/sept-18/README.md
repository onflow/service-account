# Add one verification node to the approved list of nodes

> Sept 18th, 2024

Adds One Verification node staked by Ankr:

1. "f441ce06e155367c05c941b68fdb1bb3f0cb9efe0d8cc9a9932d7d1dbfd13f2c"


## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://www.flowdiver.io/tx/


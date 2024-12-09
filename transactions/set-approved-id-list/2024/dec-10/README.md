# Add one verification node to the approved list of nodes

> Dec 10th, 2024

Adds One Verification node staked by Coinage-DAIC:

1. "be436e52a1f41893bd81f4ff837866c67287bee89974824f62772e678c33229b"


## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

Successful attempt: 


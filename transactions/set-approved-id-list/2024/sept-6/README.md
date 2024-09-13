# Add one verification node to the approved list of nodes

> Sept 6th, 2024

Adds One Verification node staked by Firstset:

1. "7055e6d5f9f64d2decd195775711cb1575ac8aec0eb8dddbeba92444068c9d50"


## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://www.flowdiver.io/tx/3aa69e2be723860560eb9ec7baaa6bd18fab7ef27ac556717e6b75730fdb0891


# Add three consensus nodes to the approved list of nodes

> June 24th, 2024

Adds One Verification node staked by Edgevana:

1. "64d238cb07da201fa136e2eadbb5c5aa8bde2d4d2bffe13a11c591d78ee7bd63"


## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://www.flowdiver.io/tx/5d901d9595df6fc8f5677f0c677c12c64212a0c0764efc9bbb26684e75771259


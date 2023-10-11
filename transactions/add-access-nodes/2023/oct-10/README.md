# Increase Access node Slot Limit

> Oct 10th, 2023 

Increases the slot limit for Access nodes by 2

## Using Multisign tool

1. DapperLabs generates the Signature Request ID on the [site]() for the `add_access_limits.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

Successful attempt: https://www.flowdiver.io/tx/5dfcaf5b95d21f7418d76c877b2e160f357ba8f1aa7712c3db4013e6e496611a


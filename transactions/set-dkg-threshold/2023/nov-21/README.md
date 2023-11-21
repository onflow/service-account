# Set DKG Success Threshold

> Nov 21, 2023 

Set the DKG success threshold to 70%.

### Context
- we're assuming our current consensus implementation allows up to 20% offline nodes before finalization performance becomes unacceptably degraded
- this would give t_safety = 70% if we would like to cover the worst case scenario (all offline nodes during epoch have RB keys)
- this would give t_safety = 62% if we would like to cover only the average case scenarios (offline nodes are picked uniformly from all nodes)

62% may be too risky as the average case is likely to happen during an epoch. 70% covers all cases and is not high enough to be likely to cause otherwise avoidable DKG failures. (Past DKG failures on MN and TN would have passed with 70%). Therefore we settled on 70%.

## Using Multisign tool

1. Flow/Vishal generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) for the `set_safe_threshold.cdc` transaction with the given args.

2. Signers sign with the multisign tool

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results

https://www.flowdiver.io/tx/580538214be4e1c692463e15eaaab7dc607b91a59c8ff53237cdd38c9a227eac


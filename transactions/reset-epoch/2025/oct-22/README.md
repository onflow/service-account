# Reset Epoch after the Forte upgrade

> Oct 22nd, 2025

When network is upgraded (spork), the protocol state is manually initialized via the bootstrapping process.
Therefore, we need to re-synchronize the FlowEpoch smart contract each time the network is upgraded, using the [ResetEpoch](../../../../templates/reset_epoch.cdc) transaction.

[Site](https://flow-multisig-git-service-account-onflow.vercel.app/)

## Results

https://www.flowdiver.io/tx/
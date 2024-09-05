# Reset Epoch after the Crescendo upgrade

> Sept 4th, 2024

Any time the network is sporked, the protocol state is manually initialized via the bootstrapping process.
Therefore, we need to re-synchronize the FlowEpoch smart contract each time the network is sporked, using the [ResetEpoch](../../../../templates/reset_epoch.cdc) transaction.

[Site](https://flow-multisig-git-service-account-onflow.vercel.app/)

## Results

https://www.flowdiver.io/tx/6948b643724ed42368c3e78c587742c7ab407dd0d5ea026dda0fb813be1f0cdc
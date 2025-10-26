# Reset Epoch after the Forte upgrade

> Oct 22nd, 2025

When network is upgraded (spork), the protocol state is manually initialized via the bootstrapping process.
Therefore, we need to re-synchronize the FlowEpoch smart contract each time the network is upgraded, using the [ResetEpoch](../../../../templates/reset_epoch.cdc) transaction.

[Site](https://flow-multisig-git-service-account-onflow.vercel.app/)

## Results


## Failed attempts:


1. 949134b1cc3039ad8387aa64672198de6227a8bbbed4347880c7783dea83948d
2. 703c789738f080e7506148ebe1cff7b5353536bddd91b3eb278e51af3281994a

https://www.flowscan.io/tx/d7230bb5d962cf1797252559dc1469f71038b985b848bdc8dd7e33974703607d
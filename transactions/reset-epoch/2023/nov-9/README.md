# Reset Epoch

> Nov 9th, 2023

Any time the network is sporked, the protocol state is manually initialized via the bootstrapping process.
Therefore, we need to re-synchronize the FlowEpoch smart contract each time the network is sporked, using the [ResetEpoch](../../../../templates/reset_epoch.cdc) transaction.

[Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=reset_epoch.cdc&param=%5B%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%22100%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22String%22,%20%09%09%22value%22:%22b976876c61579eff5e95af815c78618a%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%220%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%22459999%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%22482999%22%20%09%7D%20%5D&acct=e467b9dd11fa00df&limit=1000000)

## Results

Succeeded:
https://flowscan.org/transaction/



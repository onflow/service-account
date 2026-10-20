# Update Collection cluster count 

Update the collection cluster count on Flow mainnet from three to one.

## Transaction

Transaction to execute: https://github.com/onflow/flow-core-contracts/blob/master/transactions/epoch/admin/update_clusters.cdc

## Result

https://www.flowscan.io/tx/989a72f439ec059c7365113a18db64f390b026a366d1fafb792e38379f35d5af

## Verify

Script to verify: https://github.com/onflow/flow-core-contracts/blob/master/transactions/epoch/scripts/get_config_metadata.cdc

Before the change:

```
$ flow scripts execute get_config_metadata.cdc -n mainnet

Result: A.8624b52f9ddcd04a.FlowEpoch.Config(numViewsInEpoch: 756000, numViewsInStakingAuction: 720000, numViewsInDKGPhase: 3000, numCollectorClusters: 3, FLOWsupplyIncreasePercentage: 0.00093871)
```


After the change:

```
$ flow scripts execute get_config_metadata.cdc -n mainnet

Result: A.8624b52f9ddcd04a.FlowEpoch.Config(numViewsInEpoch: 756000, numViewsInStakingAuction: 720000, numViewsInDKGPhase: 3000, numCollectorClusters: 1, FLOWsupplyIncreasePercentage: 0.00093871)
```

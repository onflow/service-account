# Update Collection cluster count 

Update the collection cluster count on Flow mainnet from three to two.

## Transaction

Transaction to execute: https://github.com/onflow/flow-core-contracts/blob/master/transactions/epoch/admin/update_clusters.cdc

## Result


## Verify

Script to verify: https://github.com/onflow/flow-core-contracts/blob/master/transactions/epoch/scripts/get_config_metadata.cdc

Before the change:

```
$ flow scripts execute get_config_metadata.cdc -n mainnet

Result: A.8624b52f9ddcd04a.FlowEpoch.Config(numViewsInEpoch: 756000, numViewsInStakingAuction: 720000, numViewsInDKGPhase: 3000, numCollectorClusters: 3, FLOWsupplyIncreasePercentage: 0.00093871)
```


After the change:

```

```

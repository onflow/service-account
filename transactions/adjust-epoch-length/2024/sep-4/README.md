# Adjust Epoch Length 

This service account transaction updates the epoch length to increase the block rate,
taking advantage of performance improvements. It also enables [FLIP204 - Smart-Contract-Specified Epoch Switchover Timing](https://github.com/onflow/flips/pull/204) on Mainnet.


### Context

Currently, Mainnet produces 0.8 blocks/second. Note that Flow's consensus does not run as fast as it can, but is slightly throttled, because we desire a consistent epoch switchover time every Wednesday at 19:00 UTC, so people know when to stake, bring up their nodes, and when they can expect to receive staking rewards. 

Epochs have a fixed length, measured in views. Though, if consensus proceeds at its maximum speed, the view rate of the network varies depending on network conditions (eg. load, offline nodes, etc), resulting in deviations of the epoch durations of multiple hours, which accumulate over time. Hence, we have implemented an adaptive distributed control algorithm, called [Cruise Control](https://www.notion.so/flowfoundation/Software-Design-56759c18b5e84d2bb0dfbf411941fd27?pvs=4#24f6a9bfab4d4bfdbb4a1b68aca932d5), which dynamically throttles the block production, so consensus progresses through a pre-defined number of views every second. 

Since the introduction of Cruise Control (April 2023), there have been a variety of performance improvements which improved the computing time for a consensus round (view) from roughly 830ms to 220ms. However, Cruse Control was still working with the set point of 0.8 blocks/second.

### Goal

We reconfigured Curise Control, to allow consensus to proceed with a significantly faster block rate. This will help to reduce the latency for clients of the flow network (specifically Time To Finality, and Time To Executed). The new set point of 1.25 blocks per second speeds up consensus as much as possible, while still maintaining sufficient leverage for Cruise Control to compensate for disturbances and potential byzantine actors trying to drive the network away from the targeted view rate (see [our analysis](https://www.notion.so/flowfoundation/Cruise-Control-headroom-for-speedups-46dc17e07ae14462b03341e4432a907d?pvs=4) for more details).

## Parameter Derivation

Mainnet epochs are 1 week, so we set:
- EPOCH_LENGTH = 7·24·60·60·1.25 = 756,000

The staking auction is in effect until 8 hours before the epoch switchover, so it is 7·24-8=160 hours long.
- STAKING_PHASE_LENGTH = 160·3600·1.25 = 720,000

During each of the 3 DKG phases, there should be ample time for nodes to participate and an additional time buffer in case a node DKG transactions get dropped during times of network congestion, the node's networking connection is overloaded or temporarily disturbed, or the node needs a extra time to catch up. Empirically, we have found that a DKG phase taking roughly 40 minutes (±10 min) is a good value to rule out DKG failures from nodes running out of time, while also permitting new nodes to come online reasonably close to the epoch switchover (8 hours to be precise).

At a rate of 1.25 views per second (happy path), the length of a 60-min DKG phase would approximately be 40·60·1.25 = 3000 views:
- DKG_PHASE_LENGTH = 3000

## Epoch Timing Config
Unlike Testnet, we do not need to additionally modify the epoch timing config. The current epoch timing config is:
```
% flow scripts execute get_epoch_timing_config.cdc -n mainnet

Result: A.8624b52f9ddcd04a.FlowEpoch.EpochTimingConfig(duration: 604800, refCounter: 101, refTimestamp: 1700074800)
```

- The `duration` is 1 week in seconds
- The `refCounter` and `refTimestamp` reference the epoch switchover from Wed Nov 15 2023, when the smart contract for [FLIP 204](https://github.com/onflow/flips/pull/204) was first deployed to Mainnet.

We can verify that this config produces the desired timing with the script:
```
% flow scripts execute get_target_end_time.cdc 144 -n mainnet

Result: 1726081200
```

This script computes the target end time for epoch 144 using the current configuration.
- Epoch 144 should begin at 19:00UTC Sep 4 and end at 19:00UTC Sep 11
- The computed end timestamp of 1726081200 corresponds to Wed Sep 11 2024 19:00 UTC

## Transaction Details
- The script to use is [here](./../../../../templates/adjust_epoch_length.cdc)
- The arguments are [here](./arguments.json) in this directory

## Result
https://www.flowdiver.io/tx/6ff10d1fa1a2bbb94af354e60e01339fcaac65ed66070e4edecac81c0f40556d
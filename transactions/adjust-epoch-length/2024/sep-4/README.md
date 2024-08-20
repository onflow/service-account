# Adjust Epoch Length 

This service account transaction updates the epoch length to increase the block rate,
taking advantage of performance improvements. It also enables [FLIP204 - Smart-Contract-Specified Epoch Switchover Timing](https://github.com/onflow/flips/pull/204) on Mainnet.

Currently, Mainnet runs at ~0.8 blocks/second. After this change, it will run at 1.25 blocks/second.

## Parameter Derivation

Mainnet epochs are 1 week, so we set:
- EPOCH_LENGTH = (7)(24)(60)(60)(1.25) = 756,000

The staking auction is in effect until 8 hours before the epoch switchover, so it is (7)(24)-8=160 hours long.
- STAKING_PHASE_LENGTH = (160)(3600)(1.25) = 720,000

The DKG phase length is currently 2000 views on Mainnet.
The consensus block rate is increasing by (1.25-0.8)/(0.8)=0.56 -> 56%.
In order to maintain a similar wall-clock time, we increase the DKG phase length by 50%, and set:
- DKG_PHASE_LENGTH = 3000

## Epoch Timing Config
Unlike Testnet, we do not need to additionally modify the epoch timing config. The current epoch timing config is:
```
% flow scripts execute get_epoch_timing_config.cdc -n mainnet

Result: A.8624b52f9ddcd04a.FlowEpoch.EpochTimingConfig(duration: 604800, refCounter: 101, refTimestamp: 1700074800)
```

- The duration is 1 week in seconds
- The refCounter and refTimestamp reference the epoch switchover from Wed Nov 15 2023, when the smart contract for FLIP 204 was first deployed to Mainnet.

We can verify that this config produces the desired timing with the script:
```
% flow scripts execute get_target_end_time.cdc 144 -n mainnet

Result: 1726081200
```

This script computes the target end time for epoch 144 using the current configuration.
- Epoch 144 should begin at 19:00UTC Sep 4 and end at 19:00UTC Sep 11
- The computed end timestamp of 1726081200 corresponds to Wed Sep 11 2024 19:00 UTC

## Transaction Details
- The script to use is [here](./../../../../templates/adjust_epoch_length_v2.cdc)
- The arguments are [here](./arguments.json) in this directory

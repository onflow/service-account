# Add Service Staking Account and Staking account Signing privileges for Deniz (BlueSign) and removing keys for FlowScan.

## This is implementation of the following two FLIPS:
1. [FLIP 321](https://github.com/onflow/flips/blob/5c23e1798c4f1d0bd49fc37954923170771aec79/governance/20250319-redundancy-improvement.md)
2. [FLIP 326](https://github.com/onflow/flips/blob/a88f94057f7292a9dc86ae679e3a3fbdc78d3313/governance/20250412-removing-ichi-from-multi-sig.md)

Transaction: [replace_key.cdc](../../../../templates/replace_key.cdc)

> April 15th, 2025

## Public Keys in arguments

Key to be added to the service account and staking account for FLIP 321:

- `??` - Encoded (Sig: ECDSA_P256, Hash: SHA2_256, Weight: 250)
- Index at which this key will get added
  - Service account index: 19
  - Staking account index: 11

Key to be removed from the service account and the staking account for FLIP 326:

- Service account index: 9
- Staking account index: 3


## Adding key to the Service account
[Transaction url]()

## Adding key to the Staking account
[Transaction url]()



## Results


1. https://flowscan.org/transaction/d565222c819d18a8951624ce65a9b8875879c864bcf27cadb6767ea5a1d669e9
2. https://flowscan.org/transaction/a9aaf36be4d873a31dbd7e671f13709e6b76e9991bdd5344bb54b6ae592b59b1
# Add Service Staking Account and Staking account Signing privileges for Deniz (BlueSign) and removing keys for FlowScan.

## This is implementation of [FLIP 208](https://github.com/onflow/flips/blob/main/governance/20231005-Adding-bluesign-as-multi-sig.md)

Transaction: [replace_key.cdc](../../../../templates/replace_key.cdc)

> Nov 16th, 2023

## Public Keys in arguments

Key to be added to the service account and staking account:

- `475aac6dc9e0a045323f8e24f0aa8ebbec9dfedc34a5cc47bbb206f8d639f03812231731a9608edab6582056ab0a3281350666330daca384c7dff777cc6823be` - Encoded (Sig: ECDSA_P256, Hash: SHA2_256, Weight: 250)
- Index at which this key will get added
  - Service account index: 18
  - Staking account index: 10

Key to be removed from the service account and the staking account:

- `0xee4aec89e6d83fe563ee93de01374961fcf117b7e746c78b3097f54b630a053fd4ee70a4bde974ce12d71deb444c5c23c224ad92f05a6f72b54742fd9700a3b7`
- Service account index: 17
- Staking account index: 9


## Adding key to the Service account
[Transaction url]()

## Adding key to the Staking account
[Transaction url]()



## Results


1. https://flowscan.org/transaction/d565222c819d18a8951624ce65a9b8875879c864bcf27cadb6767ea5a1d669e9
2. https://flowscan.org/transaction/a9aaf36be4d873a31dbd7e671f13709e6b76e9991bdd5344bb54b6ae592b59b1
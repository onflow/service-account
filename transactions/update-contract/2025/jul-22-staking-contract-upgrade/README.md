# FLIP 321 Implementation

> July 22nd, 2025

Implementation of [FLIP 321: Enforcing Domain-Based Networking Addresses for Nodes](https://github.com/onflow/flips/blob/main/protocol/20250619-network-address-validation.md)

Updating the `FlowIDTableStaking` contract by submitting the [update contract](../../../../transactions/update-contract) transaction with the Staking account (`0x8624b52f9ddcd04a`) as the payer and signed by the service committee.

### Transaction - FlowIDTableStaking Upgrade using the Staking account `0x8624b52f9ddcd04a`

Used this to generate the contract code arguments:

jq -n --arg name "FlowIDTableStaking" --arg value "$(xxd -p ./FlowIDTableStaking.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowIDTableStaking.json

Verified using:
```
$ cat arguments-FlowIDTableStaking.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowIDTableStaking.cdc
(Should produce no difference)
```

### Result:
https://www.flowscan.io/tx/2fe712b9eddedeca242cf1fbad8c104c279f1f9d9987e428b5c2fc8c3f299f23

## Test:

1. Invalid networking address - IP instead of domain name
   https://www.flowscan.io/tx/c28c2d917b935eb584f6c8b1974ad219b8e6fa7b71af2c1d7fd62180fbceba31?tab=script

2. Invalid networking address - Domain name missing port
   https://www.flowscan.io/tx/36bfe872ec095be5cd2ab9cf31a589119d1a254d9f2fc00bb5ea2733b39c84db?tab=script

3. Happy Path: Valid networking address:
   https://www.flowscan.io/tx/6e10bdbe5fa26b3e5899c5d1859526f70631ebceb49435293590ff1b3b31bb53
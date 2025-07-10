# FLIP 321 Implementation

> July ??, 2025

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

### Resylt:

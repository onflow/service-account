# Proof of Possession Rollout

> June 3rd, 2025

As part of the Proof of Possession roll out, 3 core contracts need to be upgraded.
1. FlowIDTableStaking (addNodeRecord function) using the Staking account `0x8624b52f9ddcd04a` (multi-sign)
2. LockedTokens (registerNode function) using the account `0x8d0e87b65159ae63` (not a multi-sign)
3. FlowStakingCollection (registerNode function) using the account `0x8d0e87b65159ae63` (not a multi-sign)

## Transactions

[update contract](../../../../transactions/update-contract)

### Transaction 1 - FlowIDTableStaking Upgrade using the Staking account `0x8624b52f9ddcd04a`

Used this to generate the contract code arguments:

jq -n --arg name "FlowIDTableStaking" --arg value "$(xxd -p ./FlowIDTableStaking.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowIDTableStaking.json

Verified using:
```
$ cat arguments-FlowIDTableStaking.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowIDTableStaking.cdc
(Should produce no difference)
```

### Resylt: https://www.flowscan.io/tx/dc33db70318cd9c27d974fd490b972e77a24ea5b767896a2eda390d93ecfe229

### Transaction 2 - LockedTokens Upgrade

jq -n --arg name "LockedTokens" --arg value "$(xxd -p ./LockedTokens.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-LockedTokens.json

Verified using:
```
$ cat arguments-LockedTokens.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt LockedTokens.cdc
(Should produce no difference)
```
### Result: https://www.flowscan.io/tx/329603b401b413ea4fbf9bf734712e24ad5ffd264ca48c91e6c99efc42ab9f67

### Transaction 3 - FlowStakingCollection Upgrade

jq -n --arg name "FlowStakingCollection" --arg value "$(xxd -p ./FlowStakingCollection.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowStakingCollection.json

Verified using:
```
$ cat arguments-FlowStakingCollection.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowStakingCollection.cdc
(Should produce no difference)
```

### Result: https://www.flowscan.io/tx/2401a6985edb50376515094c750aa0404be9d30297ac470e7a598090b49bda66
___



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

### Transaction 2 - LockedTokens Upgrade

jq -n --arg name "LockedTokens" --arg value "$(xxd -p ./LockedTokens.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-LockedTokens.json

Verified using:
```
$ cat arguments-LockedTokens.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt LockedTokens.cdc
(Should produce no difference)
```

### Transaction 3 - FlowStakingCollection Upgrade

jq -n --arg name "FlowStakingCollection" --arg value "$(xxd -p ./FlowStakingCollection.cdc  | tr -d '\n')" '[{"type":"String","value":$name},{"type":"String","value":$value}]' > arguments-FlowStakingCollection.json

Verified using:
```
$ cat arguments-FlowStakingCollection.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowStakingCollection.cdc
(Should produce no difference)
```

___

### Results

Unsuccessful attempt (if any): 

Successful attempt: Tx ID:

___


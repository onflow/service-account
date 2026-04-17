# Testnet Contract Upgrade

4/17/2026

## Contracts to be upgraded:
1. StakingProxy.cdc
2. FungibleTokenSwitchboard.cdc

## Contract Changes:

1. https://github.com/onflow/flow-core-contracts/pull/582

```
--- 0x7aad92e5a0715d21/StakingProxy (deployed)
+++ https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/contracts/StakingProxy.cdc
@@ -27,9 +27,9 @@

         init(nodeID: String, role: UInt8, networkingAddress: String, networkingKey: String, stakingKey: String) {
             pre {
-                nodeID.length == 64: "Node ID length must be 32 bytes (64 hex characters)"
+                nodeID.length == 64: "StakingProxy.NodeInfo.init: Node ID length must be 32 bytes (64 hex characters) but got \(nodeID.length)"
                 networkingAddress.length > 0 && networkingKey.length > 0 && stakingKey.length > 0:
-                        "Address and Key have to be the correct length"
+                        "StakingProxy.NodeInfo.init: Address and keys must all be non-empty"
             }
             self.id = nodeID
             self.role = role
```

2. https://github.com/onflow/flow-ft/pull/190

```
--- 0x9a0766d93b6608b7/FungibleTokenSwitchboard (deployed)
+++ https://raw.githubusercontent.com/onflow/flow-ft/refs/heads/master/contracts/FungibleTokenSwitchboard.cdc
@@ -330,7 +330,7 @@
                     // the underlying vault types they accept.
                     if receiverType.isSubtype(of: Type<@{FungibleToken.Receiver}>()) {
                         let subTypes = receiverRef.getSupportedVaultTypes()
-                        for subReceiverType in subTypes.keys {
+                        for subReceiverType in subTypes {
                             let supported = subTypes[subReceiverType]!
                             if supported && subReceiverType.isSubtype(of: Type<@{FungibleToken.Vault}>()) {
                                 supportedVaults[subReceiverType] = true
```

## Transaction

[update contract](../../..)

1. Sign using staking account (`0x7aad92e5a0715d21`) for StakingProxy
2. Sign using fungible token account (`0x9a0766d93b6608b7`) for FungibleTokenSwitchboard


## Args

1. StakingProxy

`cat "./StakingProxy.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args_for_staking_proxy_update_contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt StakingProxy.cdc
(Should produce no difference)
```

2. FungibleTokenSwitchBoard

`cat "./FungibleTokenSwitchboard.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat args_for_fungible_token_switchboard_update_contract.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FungibleTokenSwitchboard.cdc
(Should produce no difference)
```

## Result

1. StakingProxy.cdc
2. FungibleTokenSwitchboard.cdc
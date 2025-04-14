# Add BlockDaemon and Edgevana nodes to the approved list of node

> April 15th, 2025

## Prerequisite

The nodes should be staked :white_check_mark:
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "663640d7bcf6cc90b151767b6ab33635177c16fb58c92df4cd473e8b5b86383b", role: 2, networkingAddress: "tibles-flow-consensus-002.edgevana.com:3569", networkingKey: "de7dd11698899f8b1751a374e42306febf3f37f07901550864dace5e0e09b5f016b0d784e07d73cd5ddfbd405fb33b810db438a3eb7db00ea8aa227d915013fc", stakingKey: "96f6e4cb001a5ffe8817fc175a291d588403bfbe3cf2b2e16b893e6a7d59c980c0bc442ab03911c003284fa96ec37b0017b7a4a9e83513f163d7c081fb578ee491e6a81e07cf6ac7222897c7975480737bf153eb2bc3bec528a8f618a37e77ba", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "c17fc97b0ef33d4cdeede5b6d033e3d918fa282a3be33d0aee40e117efbd492c", role: 2, networkingAddress: "tibles-flow-consensus-001.edgevana.com:3569", networkingKey: "c40dfb0e6e5f0d5eedfc35fbb4badac3ed07c3997468bedbe27ec174d69ed90428f114569f334728353e4122707e1acdb6353807649ed57e135ce4b8e2a628a2", stakingKey: "aa5cdc4314d71ac372ba092c1be8354287a23bb2c61d6fe777c0867bfdc568c184e9d7bb8603a90efb216a5deb1be13206e502d0d3c6277d60c828ff399c6f1c884330566639dadc0e60d149a0fd101ae697116bc3a79109df8f011ecc4252f9", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/c855a46626ee8895159bc80666cb7c5d2a8faf73e27bd0607dcaefd0beb95274

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 663640d7bcf6cc90b151767b6ab33635177c16fb58c92df4cd473e8b5b86383b | grep c17fc97b0ef33d4cdeede5b6d033e3d918fa282a3be33d0aee40e117efbd492c
```

Total count should be 370
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
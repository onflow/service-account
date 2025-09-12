# Add Hackquest nodes to the approved list of node

> Sept 12tn, 2025

## Prerequisite

Check if the node is staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "adea4ed85948b47fbe108af50033316ba8060cdb22fa5421a10c653b2a958d46", role: 4, networkingAddress: "flow-verification-node-1.hackquest.io:3569", networkingKey: "128f0c5387e8e2eb1b3d4842677f28a5fbe314721523ab75161e1c9bebe9de6df52633d3af8e8f821b4cd8a52341d0a2f89446bf512a9d4e3ab208b521ef2e7e", stakingKey: "a651c89d5e3211412cbc83d739f4f8ed23e1a660969ee57c7502ee60aeb027389ab4b1cd38ef55f86c8a2640636262a1086bcaf6adb00d1079e57dca9287db2cfc681a3d25bcb8a6f0852f18f84d7513f2b67a28a83354431571551ee73f861f", tokensStaked: 0.00000000, tokensCommitted: 535000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "2aa453ff91fc6f3f1360bc5ae0ac8b0c79680b2d49063907e12b6951f659d684", role: 4, networkingAddress: "flow-verification-node-2.hackquest.io:3569", networkingKey: "706ef377ea83a057bb1a8c51e5cfafe7123e4c00763a9bc1a6efab9367e3485f23823c699528151e527149166a769cac2fbf29075bae58a4715d5a82b902b435", stakingKey: "a05586d9f0952b2080e4b75f38f857d2b81e2accb105f81a9b4b94533cf76a63708b8fec69b01f10b0d87bcc7853eb8e1103433d8f899225b753128b576ad11db497a448713f5cf8151477ddc263ecb04bc99b53f0afc2d033b76cc55164fbec", tokensStaked: 0.00000000, tokensCommitted: 465000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

https://www.flowscan.io/tx/b010496a1842083da16ed3a268731b3a027b595f359f5026be4d1c0c7a3ab327

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep adea4ed85948b47fbe108af50033316ba8060cdb22fa5421a10c653b2a958d46 | grep 2aa453ff91fc6f3f1360bc5ae0ac8b0c79680b2d49063907e12b6951f659d684
```

Total count should be 385
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
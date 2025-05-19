# Add Quicknode nodes to the approved list of node

> May 20th, 2025

## Prerequisite

Check if the nodes are staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "76b06a5a042594c68574447adeefb111ed4618710a6bf0666825582d60c4cf3a", role: 2, networkingAddress: "flowconsensus-b00.infra.quiknode.net:3569", networkingKey: "530b2a637e62e90f857dde28173384a72e4282e26479eec0b0a02a6871a3963ec71cb1e209752ee13ff12f3cea87d266618ec13659d9ca6cca6c1efb0d9d9199", stakingKey: "ab39b1dd3b01afd974a3f231d93a2b949936a80f02666dc08089c8bbb2d8a9bc2f3ee5d10a27d92b0b308e99e954c75f03442ff7fba0e4d25c2ac7f484110a05ec14b428dcdc7612c875348b30f7eda89a8ea25c47d041a90f303bab14eb1ff9", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "f2dd4e87abf104e7425a207d83eb52154861503f8c99649146af121f8f0b6cd5", role: 2, networkingAddress: "flowconsensus-b01.infra.quiknode.net:3569", networkingKey: "8c8f04506335769fd0aee381054598f76b920a320002f46dce9de619ef2f87399ad1653dc3ede1b7003c01dd6f0b79f8ee97d9b143934224499c0a4d3374da92", stakingKey: "af1e3f48f1ddba50156d23b672e4a48f2daf4502fe63519d58d0a6335afdc3e0995f49ac333850c55f83a320c9a48f9d0b539610f862cba8b33f7d13f01cbab9b5ebb8bf32cd962ecadf3d6dcfc14145b7e4aa2848f1995e77c2cd4f6746156e", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt:

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 76b06a5a042594c68574447adeefb111ed4618710a6bf0666825582d60c4cf3a | grep f2dd4e87abf104e7425a207d83eb52154861503f8c99649146af121f8f0b6cd5
```

Total count should be 382
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
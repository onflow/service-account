# Add FindLabs node to the approved list of node

> Aug 19th, 2025

## Prerequisite

Check if the node is staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "7ddf1996d72ff47f91fc930a3956a400daeb4f1a5ef2db3ee3928add0b5b9408", role: 2, networkingAddress: "flow-consensus-1.findlabs.io:3569", networkingKey: "ec797dd03eaf019f49aa7961ef47ef1f24668115e006b5725be98f35b3225803a2b2d2f88ff8b69cf683d9b40af12a115824734ccc76d919cbf57df49190ed52", stakingKey: "8a442155139e3a2719e19cc31e5a18c9910ca6f2226e9865c873a2f59b3e4966b209b42c8e5934a29375a66d4cdea0a60ce5a36eed4cbeec81ad0b4391ee19d127437e2e09fbfccf0e0895e6d296615bfdb0ef267de4693a7b1afd1f0f7e5392", tokensStaked: 0.00000000, tokensCommitted: 5000000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt:https://www.flowscan.io/tx/b0da954839e399fcb6b6b6b73bc28e0f806ce2695433ebfb503aa2d502b53bcb

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 7ddf1996d72ff47f91fc930a3956a400daeb4f1a5ef2db3ee3928add0b5b9408
```

Total count should be 383
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
# Add Animoca node to the approved list of node

> Nov 25th, 2025

## Prerequisite

Check if the node is staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "528691f6447dcf63c301103abec6b31eed44aa08c947256db03d3a8e44e6a68c", role: 4, networkingAddress: "flow-verification-node-mainnet.moca-services.xyz:3569", networkingKey: "a7b3ede3c2446680056d7b139f6fff35fbf9a4f0c4cd52d2f627b105766a7465f14bae34fe295f16089ac0b446a751acc93f744f5e39c4738d942fcb8c36b839", stakingKey: "aee952fe9dd06d8c36ae962339220bf1fd01ae07f944e714b9174569f59ba0edf0affe00e3a9e6a3b487595318b194490ccefbdbf246c42f74ead3931c9ce193879fb514be641f5dea33c37b12d29cb9a9c31eed1e3e66df4b8b6728265bf067", tokensStaked: 0.00000000, tokensCommitted: 150000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

https://www.flowscan.io/tx/

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 528691f6447dcf63c301103abec6b31eed44aa08c947256db03d3a8e44e6a68c
```

Total count should be 384
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
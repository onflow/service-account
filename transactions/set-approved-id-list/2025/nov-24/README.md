# Add Animoca node to the approved list of node

> Nov 19th, 2025

## Prerequisite

Check if the node is staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "6dd9c506543d57f24b54dabb318df7403da6afba035d2c869833ac85673a85c8", role: 4, networkingAddress: "flow-verification-node.moca-services.xyz:3569", networkingKey: "f456635d3073ff529613cd65a52bbdc43595fc888197cbe9ccb2ff69aa613e804488f190ecff066b7682784c0f5b2b59c756a4fa7978c53f5a6b5a056552cc88", stakingKey: "a74f174d2a3b678d43effc6f651eb8fc38f9fad00971cace7607b4b982e8831e2e339100b5d6edc725b4a8de6342a90807d7aaba69d9f8472952a455a52503045c5744dd395225c2483294a94577084a5aa2911df032f8a70e2e87201a6db054", tokensStaked: 0.00000000, tokensCommitted: 150000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

https://www.flowscan.io/tx/

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 6dd9c506543d57f24b54dabb318df7403da6afba035d2c869833ac85673a85c8
```

Total count should be 384
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
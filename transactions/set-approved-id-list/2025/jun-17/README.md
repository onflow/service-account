# Add Edgevana node to the approved list of node

> June 17th, 2025

## Prerequisite

Check if the nodes are staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "db2877cb20c473fd351e2cefdb1b05f55d4dbed66d73087e7777e4a29d2869cf", role: 2, networkingAddress: "edgevana-flow-consensus-001.edgevana.com:3569", networkingKey: "449e670356672e5e3631372b04f13a74ff851ebd77501ead541bfea52cfb17cdbebfb829480923a01e48eef7508fd07aa5ffd7e077679332406786949afe7f19", stakingKey: "b320a48afbc1be46c563f5b460c73ac83842a00badf75aa3ed085182660d18c04225586c54b341084f78a7c221e3297b0f92b51837045e987bcbe9a016f2c627ba228b1117a7a175f0d78141ff69a1559c16cd14ed38e9ee7effe619b3b93ea6", tokensStaked: 0.00000000, tokensCommitted: 650000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```

## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

https://www.flowscan.io/tx/9aaf31488ad232daec36c0bcd3b6bb7c4cb109291236ff73ace8f495e3c3a8fd

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep db2877cb20c473fd351e2cefdb1b05f55d4dbed66d73087e7777e4a29d2869cf
```

Total count should be 384
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
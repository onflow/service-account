# Add TWM node to the approved list of node

> June 30th, 2026

## Prerequisite

Check if the node is staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "d6a3a5c528bbb598672e0d57308bc1ad1999f8bc82ee037a9bc6875890d986ea", role: 4, networkingAddress: "verification02.twm-staking.com:3569", networkingKey: "83fcf9b61bf0cda3ad9b7ba7f5c8947043189ea352d065954fc3c95943bf6a942fd3ea13ebc703f05041e0e71ff50d23204a1aee84dfb6fecb01974d30d065b5", stakingKey: "b91cd137bbc1206c9f51b2d2443035cd3749d27b174167e593c98a587af7e273758f663c90f5afc509438b7bdaedee8a13026ca0a6068f3a79d63d1c27cfcacd0d381357aab2bd1a466522ad36cb520b7b13765f09fd7e01078f74c173fd7d1c", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results



## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep d6a3a5c528bbb598672e0d57308bc1ad1999f8bc82ee037a9bc6875890d986ea
```

Total count should be 336
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
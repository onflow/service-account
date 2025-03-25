# Add Flipsde Consenus nodes to the approved list of node

> Mar 25th, 2025

## Prerequisite

The node should be staked :white_check_mark:
```shell
$  flow scripts execute ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"7ac8e6a500513bf9137d5b16274f0148d422a770e1d3109def03e8c839a9f9a1"}]'  -n mainnet

Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "7ac8e6a500513bf9137d5b16274f0148d422a770e1d3109def03e8c839a9f9a1", role: 2, networkingAddress: "65.108.206.250:3569", networkingKey: "475cb5f040b46b04335a85df178d4917a77cb228150ae0acbcbdff03aa42f0ac6bc10fdb3ad99ef75bd46152584ceae4aab18822ab142c595b7a5f153fffcde1", stakingKey: "81822fa7e795a7eca259d0f13de42c683622ee0917c7c4c66b47cf57220f28ccc1c0df6c911ba35146c05cc7cbdb6bd51273d3537ca127897930f5419c981d948c74731497d5bb5436b0a4172035e15d7a64165589beca4dd5f5030a00dbb8d1", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)

```

## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/c383e18d565d82f8b136369479620b40004eab8e6b7a8ee00a7545221a7bf2fe

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep 7ac8e6a500513bf9137d5b16274f0148d422a770e1d3109def03e8c839a9f9a1


```

Total count should be 358
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
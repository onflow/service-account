# Add Flipside Consensus nodes to the approved list of node

> Mar 25th, 2025

## Prerequisite

The nodes should be staked :white_check_mark:
```shell

$  flow scripts execute ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"e1db82917272645dfc62192bf0c7e813a2b97435310e2b8cc94b7cb48eaf527b"}]'  -n mainnet

Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "e1db82917272645dfc62192bf0c7e813a2b97435310e2b8cc94b7cb48eaf527b", role: 2, networkingAddress: "flipside-flow-consensus-003.edgevana.com:3569", networkingKey: "2ee875c2884e198c1497b7d9b6944a22d57b7154aa81d2107f5af968871b881cb923e374fea9d212860357d8da6dd0eb599338e01aa8797d11efe8b84accfd2d", stakingKey: "95ecd0c2c7ec39e3c963b8b084e5f21fe9ca09e8545444329cc36d45ccae9554e1b7e8bab76f4830c3e66980a66732030f72d3c483a2d6e8621a31135f60ca091e2eb08354dbde4a9eb1e328a9a6846f9d9337c794ada0893f12d482afea3e9d", tokensStaked: 0.00000000, tokensCommitted: 1170000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)

$  flow scripts execute ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"7cc078ff76a4757bdfadf493a70844020eea9fe4260d6c5641a14959e7467810"}]'  -n mainnet

Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "7cc078ff76a4757bdfadf493a70844020eea9fe4260d6c5641a14959e7467810", role: 2, networkingAddress: "flipside-flow-consensus-004.edgevana.com:3569", networkingKey: "44a0a07647f1a4af39f5945c2282db3e344bd422f9fe0ef9b766fc1dedff9a50beb8ba86af7dc5b0b014626b6a5b3609dd6cc1959b2df27c64d4e40a9651217c", stakingKey: "b26b4a2cf56cbdd9de3138b37b26e6cbe528321f4a8b0fb4a02ba4c73cbbdf9a35e4a5905cbe13815922650e4976d0c5189b8f6ea8a5d772cf7c1fb77523f31df378aecc5435bd0276dece98ad6df0818bb8344846e95bfab824af1765ead9ca", tokensStaked: 0.00000000, tokensCommitted: 1170000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)

$  flow scripts execute ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"e25e42a56a4d0f5600ca3993d513dfd1c9b55fcb832c92b3da234611701ee4e2"}]'  -n mainnet

Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "e25e42a56a4d0f5600ca3993d513dfd1c9b55fcb832c92b3da234611701ee4e2", role: 2, networkingAddress: "flipside-flow-consensus-005.edgevana.com:3569", networkingKey: "e3770f336758e59f6199f750d5c0acf398aeadc262cee9fdb227c2ef1f93b2a6bd9f69a736b3e43bfdcb0ae7ba2382d52b87ddaae8385da5bed87088a692e04b", stakingKey: "a666c5dc8427889ce898cb61c74499fc2e2681172ccb873ba4a0963bff26de58c84b4cfa04291d59c60e6e8510e7eee70169c55f7778d3abb0873c8f889d548f07cd8287ea56cd8a226c5ce20414467e76bb2c2e8500ce2a41f01d6bf654a3e2", tokensStaked: 0.00000000, tokensCommitted: 919999.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)

```

## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep e1db82917272645dfc62192bf0c7e813a2b97435310e2b8cc94b7cb48eaf527b

flow scripts execute get_approved_nodes.cdc -n mainnet | grep 7cc078ff76a4757bdfadf493a70844020eea9fe4260d6c5641a14959e7467810

flow scripts execute get_approved_nodes.cdc -n mainnet | grep e25e42a56a4d0f5600ca3993d513dfd1c9b55fcb832c92b3da234611701ee4e2

```

Total count should be 361
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
# Add Quicknode nodes to the approved list of node

> May 27th, 2025

## Prerequisite

Check if the nodes are staked
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "df209488245c39063f48d3642d9691f78daf3e35985bd2f348efe4d33a63e344", role: 2, networkingAddress: "flowconsensus-b02.infra.quiknode.net:3569", networkingKey: "82aeb04385175a48fc0fd60842d5fc125bb66f732d699ba76c668a0675f147e16a798b95877010ff6618a259a7f878b73bed7fe231b2d68407b700e2dbd45485", stakingKey: "93a34fb7e3b0f4b6ef041689d0f837cd97448f0493f934619684c8caa1d0eff84fcabd3bbbefd9e343a4e3016ba97e811427a9ddf6058d589cfb35677a795c31d5a17cb1e01928f2065e8d01cfe0f6f41a9ed18522e5b61062e5a159e026a86e", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "26d6142ae2bb58b5c174dd22c0fd4345c1b5f379d7e07fc1b65ad71ba547aede", role: 2, networkingAddress: "flowconsensus-b03.infra.quiknode.net:3569", networkingKey: "5cb806a05924f66371e858d226ebbe205ee22d1eed9c9d34de8bc610ccaabadcd9a2a1f17e170a7a927dc4665601a438ea393420c2ac9ee0455d1da2e2f9d734", stakingKey: "82f0c62dbfda1c9a582bd254b0728eda5eb8ac3b13890bbcabd6dbdaa17fa90b77f8fbc515c7377305d6958bb5c0c6ff007f56994c180dd00c348c807c5a9f22505564732e13bcf0255e7bfa153e5611ba93e57999ff3824cfec6da2507bb172", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "319faff4818d68f88a084ceb77f93bcf2e31bd6eba774f5b3e210db9661dce5c", role: 2, networkingAddress: "flowconsensus-b04.infra.quiknode.net:3569", networkingKey: "dbc4465ab410cc904fcf516862924b4e2b5454898d205ce1260dcc57629d2ee01fefda18f40a147b165109792955f82155f69a9f0cbaabb7518c73b0e5284ac9", stakingKey: "a52df7a79b69af753a9200c419478be1bde033345a6eaea35016682aaf17b2639770927a5a14e6836e5d837a8f096ef800a6a4302ff2f6e357ce5b92c702fa3cb962013c9ae630912d155e6d0afd05cd4ff26f04bedfcda4625d6eaec0dcb366", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt:

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep df209488245c39063f48d3642d9691f78daf3e35985bd2f348efe4d33a63e344 | grep 26d6142ae2bb58b5c174dd22c0fd4345c1b5f379d7e07fc1b65ad71ba547aede | grep 319faff4818d68f88a084ceb77f93bcf2e31bd6eba774f5b3e210db9661dce5c
```

Total count should be 383
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
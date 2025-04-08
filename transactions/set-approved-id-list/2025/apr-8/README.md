# Add BlockDaemon and Alchemy nodes to the approved list of node

> April 8th, 2025

## Prerequisite

The nodes should be staked :white_check_mark:
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_node_info.cdc
$ cat arguments.json | jq -r '.[0] | .value | .[] | .value' | uniq | while read -r nodeID; do   flow scripts execute get_node_info.cdc     --args-json "[{ \"type\":\"String\", \"value\":\"$nodeID\" }]"     -n mainnet; done | grep "tokensCommitted"
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "e7a9abc75ebd4249836f1ee8914de410e057e64404bc7d2df5084d60a558d7c4", role: 2, networkingAddress: "flow-mainnet-consensus-0.bwarelabs.com:3569", networkingKey: "9d199b63e020eea2f063ff24fd96393644de12b348b3e87fb92f645e9e610f2c2e87db331f2067517ba91e9cb30235ed38a720c531993f3bc5f2e968f7f30849", stakingKey: "8c5d4daca6d9c3405bc49cf032bc504a071f3fbdb0ca1132971f6439612e996e87cbd58c8001e4e23c2b3358ae9a08ce0d50c4bda8e7538cbd274a0d97abcbc49b43df792fdb5627536700a8e8b2a5cbd3848bd6176ae07d5ae495392c32ff20", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "d5c12444388ce16e9402c473b8149bce05272816c1c62c5927a6718dd25f14e4", role: 2, networkingAddress: "flow-mainnet-consensus-1.bwarelabs.com:3569", networkingKey: "47b5b1095dd4b5dd63dad9b04ea8901e38e30c23de1f31a6390722ba7e5860d974bf733521b7b51be96563815a6de7875e725427415e41e1ba4f99e7f5343ead", stakingKey: "966a1db7718710535403df538808e3a2c46b70848f794a0ceb5622121c5e43d64e5b2bc869c0806d5cc4c45ed63000901305cbd2dc34b2cd46d3dc999feed2db15a1bc00790d685cbea94bfcf4e1bd69d94d4d26e3793f00520a8b97163602c5", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "880b2a865c4169b378338eb69f49ebd835599399ebc061d0f960c082519622c5", role: 2, networkingAddress: "a16z-flow-consensus-0.bdnodes.net:3569", networkingKey: "627d46f86fb01b79ab56bee86e555bdacc076e2ef55aadb0058daaaca9727d7a6b32941b4f849427442746606c539e90f87375548c2142f06f4e078b048917f3", stakingKey: "88aee0aee11398e7ee7c20cf50ac65df73018a678bbf18412d9dce1487a4ecf5de4148c4ab347a5be3b29c5e7745a31f086fabaa49240cf543f2bc8f060f9c60b5ee90bdd19cc19e9bc82416ec22b14591582404177290424874fae8c6672eb7", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "4026299723099f813ed4492fa35cb2f7230a6bdab1ca27697f90ab038c99b68a", role: 2, networkingAddress: "a16z-flow-consensus-1.bdnodes.net:3569", networkingKey: "adcf5479c0ee02fc97826c60129d0dc5a940b3abd1cedf6de2bd12bd0b30d1fbde865afcf7e11542fd8b80a55b7989a8234ff5bf134cdc91623b413d1f62a9d4", stakingKey: "97696d7c175e848cf7eae8f8f7431170801d9ecfd0998aec6aaaf5171140bc52e51340d16827c3a1b2379dea3fc599fe0be126591e3a37c37ce6a4b2d668c2b77d548b22f3604ca40f62ea62d86800bb0ca1599bfb6d5b68ab3ce164e9e8b7a2", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "178e457f4512e0245e91f50705ab75ac4aaca400126192b7b39670b02679e53c", role: 2, networkingAddress: "a16z-flow-consensus-2.bdnodes.net:3569", networkingKey: "9d8e908191d613d9ae68f8bc6a3c8c39ad4d34f8bfca262d783ebe207662746502360017dbb344232bc3dc5fbb9de257fd9bb97dc58b33222df62869bacfe589", stakingKey: "a47d271edb284ee19e61879a0ddf90866e2188cff9996d1ebacef096e7e180034f58a421f8f85b757eb6cd364640189e052e71b6d7409ca26f064fcb1836f67a06e62ffd803a9cf1a08d91b30a735cbb564af1c0120bace5291509364b3ea3b2", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "c263677dd4eb02eb6b9c43b5b3e8508c06ba82f54116050f3563fc195e4845f2", role: 2, networkingAddress: "a16z-flow-consensus-3.bdnodes.net:3569", networkingKey: "42bb11241d43e5533ec4cb3942f02e87ffd5a918cf06edfcbfd7d4a8696bec8a1336af0cf46b96464c13bb9379e47fed277c671ebaa4aff641f07a0eff8870b2", stakingKey: "ad173837a152469b4aed23fcb97229c7a1f42508d0c2689b2e8399121794c3f9c273cac3b456a02d322c4a03e8a288e90b6d7ddff6b4194da551dda28b83b77050d19a3296ab680f55fa716c792a462975c8edfeb81d9b2d5493724dd589bd58", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
Result: A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "154c77966417060df64207e1525cebd707457bfeec5e1c86df6b8d2982410501", role: 2, networkingAddress: "a16z-flow-consensus-4.bdnodes.net:3569", networkingKey: "a51b6d03fc16ff63b2b89a79613ee050de3e56ef453ca9ecf31eaff1c22498cf0f9a098095e55a53d87a0963f1e6e00d9f1e55e419013d43215917eb8320c7db", stakingKey: "84c70f6db79c3b2998e199d9b603733e1363ca888d422a338dd41473ce051ee7df4da7d88f5283c9bf915fef40898c030bc7b4bb803465ed98d0bf3aa8a13c99d48b235399a8136bd526bfe94b834099241a2f125efff9eafc1d994331b7caa6", tokensStaked: 0.00000000, tokensCommitted: 1500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```


## Transaction: [add_approved_id_list.cdc](../../../../templates/add_approved_id_list.cdc)

## Results

Successful attempt: https://www.flowscan.io/tx/c855a46626ee8895159bc80666cb7c5d2a8faf73e27bd0607dcaefd0beb95274

## Verification

The grep command should find the node
```shell
wget https://raw.githubusercontent.com/onflow/flow-core-contracts/refs/heads/master/transactions/idTableStaking/scripts/get_approved_nodes.cdc
flow scripts execute get_approved_nodes.cdc -n mainnet | grep e7a9abc75ebd4249836f1ee8914de410e057e64404bc7d2df5084d60a558d7c4 | grep d5c12444388ce16e9402c473b8149bce05272816c1c62c5927a6718dd25f14e4 | grep 880b2a865c4169b378338eb69f49ebd835599399ebc061d0f960c082519622c5 | grep 4026299723099f813ed4492fa35cb2f7230a6bdab1ca27697f90ab038c99b68a | grep 178e457f4512e0245e91f50705ab75ac4aaca400126192b7b39670b02679e53c | grep c263677dd4eb02eb6b9c43b5b3e8508c06ba82f54116050f3563fc195e4845f2 | grep 154c77966417060df64207e1525cebd707457bfeec5e1c86df6b8d2982410501
```

Total count should be 368
```shell
flow scripts execute get_approved_nodes.cdc -n mainnet -o json | jq '.value| length'
```
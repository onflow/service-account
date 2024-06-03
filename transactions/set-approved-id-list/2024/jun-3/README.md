# Add three consensus nodes to the approved list of nodes

> June 3rd, 2024

Adds Three Consensus nodes staked by the FlowFoundation:

1. "5f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489"
2. "4f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8"
3. "b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1"

## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%225f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%224f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D,%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://flowscan.org/transaction/4f46a0f467aa6687c0d360c7fddac24a4a898778b93395e2424bbc36e41b70f1


## Verification

### Before transaction

#### Candidate nodes for next epoch

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_candidate_nodes.cdc -n mainnet

Result: {3: {}, 2: {"4f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8": true, "b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1": true, "5f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489": true}, 1: {}, 5: {}, 4: {}}

```

#### Proposed table

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_proposed_table.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/proposed_table.txt
$ cat /tmp/proposed_table.txt | wc -l
     440
```

#### Approved nodes

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/approved_nodes.txt
$ cat /tmp/approved_nodes.txt | wc -l
     391
```

#### Node info

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"5f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "5f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489", role: 2, networkingAddress: "flow--mainnet--consensus--ff-2.staking.production.figment.io:3569", networkingKey: "8ea51f7bbb633d11d9bc3d5225428e1bd9e5d6724433a057bb1f765cd290ac566da80c742e70343153c56c8270d3bed1ea92ac3d943f7aaf812e1eb921af8c61", stakingKey: "998db3392fe35d227fee1ab5b98c3cac30fdf06029b63b1c52d832fa6bfc62b296eba31baf0c40421666a15dd4ce750b0873ed60f563d72f38be8639cf2241f5088368a95916e6dc6911b359ee5647fbb1c330e19d87a02b9d642945e9dc9e14", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"4f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "4f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8", role: 2, networkingAddress: "flow--mainnet--consensus--ff-3.staking.production.figment.io:3569", networkingKey: "c6a43e368c29b86fb6639cdf7f719dfc18418501bc2caa1f48fb4166131f87161b5a42ceb0beb3a43e2b9b800ecbd5029311e862e924c336a106fc183f95821c", stakingKey: "96c47c50dd69d2c45b5312c7a4c23f609ae7c176f6a997d89b8b1bb80f4882b42d2104b0b8f5541c1c063f375e9ecb1d12689329a58dcaf5aa41d074aa5d65d5781a365593bd5cbca522b71ef31d1751266213ef3318a709a523d095d4038655", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1", role: 2, networkingAddress: "flow--mainnet--consensus--ff-4.staking.production.figment.io:3569", networkingKey: "bb77810842c9d85e7b843456af6d7fb23d5b345908eaade3c00b131297c487fe1e42a67020acb54a94e36eadc1fcd25b0f162c5899825f7ea280e124cbf7bcb5", stakingKey: "b1b04caa514cb6d02db0b1c496507f38cef302e55100188a8dbbb2cb8aa1328189200a58d05e6d260fa5b12dfa93f1270ee1e583d3cc1653ae3e5a4b25caed1cdd3cd83f2b6e56eee0178deacff6d8d39b658cd660d1582f8efe219bdc9105bc", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```

### After transaction

#### Candidate nodes for next epoch - remains the same

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_candidate_nodes.cdc -n mainnet

Result: {3: {}, 2: {"4f9e91a026235ef8e24baca73082f305820ac22f1fdbaf2ea054140606e15ae8": true, "b79849492533bdf1485a61edcaed389fe903020b0f0f3319301b2bad87b597e1": true, "5f9d17a0204dfe65871947dd3f60124e076e7010b5f083d0777c7fa8b6e15489": true}, 1: {}, 5: {}, 4: {}}
```

#### Proposed table - updated

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_proposed_table.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/proposed_table.txt
$ cat /tmp/proposed_table.txt | wc -l
  443
```

#### Approved nodes - updated

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/approved_nodes.txt
$ cat /tmp/approved_nodes.txt | wc -l
394
```


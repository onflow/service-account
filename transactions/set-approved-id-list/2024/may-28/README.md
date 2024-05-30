# Add one consensus node to the approved list of nodes

> May 28th, 2024

Adds Two Consensus nodes:
1. FlowFoundation node run by Figment `0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4`
2. Flowty node run by  Figment `4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d`


## Using Multisign tool

1. FlowFoundation generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=add_approved_id_list.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22Array%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%5B%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22type%22:%20%22String%22,%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22value%22:%20%22c458b43e2fd605b8fff871e4feb6a5fbfc87b4f4ef660bc1f6d5adc194c388f1%22%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%20%20%20%20%20%20%20%20%20%5D%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) for the `add_approved_id_list.cdc` transaction with the given args.

2. Signers sign with the multisign tool specifying the Signature Request ID
   `bash multisig.sh -f flow-staking.json <Signature Request ID>`

3. Someone submits the transaction from the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)


## Results


Successful attempt: https://flowscan.org/transaction/88f188771a8727c1887b864c02e7766c31dcecc294e716b209d41c0b1c034607


## Verification

### Before transaction

#### Candidate nodes for next epoch

```
flow scripts execute  ./transactions/idTableStaking/scripts/get_candidate_nodes.cdc -n mainnet

Result: {2: {"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d": true, "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4": true}, 5: {}, 1: {}, 4: {}, 3: {}}

```

#### Proposed table

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_proposed_table.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/proposed_table.txt
$ cat /tmp/proposed_table.txt | wc -l
     438
$ cat /tmp/proposed_table.txt | grep "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
$ cat /tmp/proposed_table.txt | grep "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
```

#### Approved nodes

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/approved_nodes.txt
$ cat /tmp/approved_nodes.txt | wc -l
     389
$ cat /tmp/approved_nodes.txt  | grep "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
$ cat /tmp/approved_nodes.txt  | grep "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
```

#### Node info

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4", role: 2, networkingAddress: "flow--mainnet--consensus--ff-1.staking.production.figment.io:3569", networkingKey: "3aadf137af728b0272892217ed54df3f4302a311df63db688bc6825ee7d82586702f6637879f6755d60b8fac8f2afd1f789dcceb61bacc8b82d1b33ba4a1a7c6", stakingKey: "8cbf2ae716f28a07bd631c4c92ee3d576f1ef62eb6262711d3fbdd6212ccec7457b70c9971e11e0d07bdbf35a187416212a44236f7f30298c92199fc6256a59da3cfe1f7cbafc574d85e1f96e98ee15d739d549212be9ba9724dc670d1a33021", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0
```

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d", role: 2, networkingAddress: "flow--mainnet--consensus--fl-1.staking.production.figment.io:3569", networkingKey: "012d916da0fe76e4dd8e079ba63ee3061ad9cf6cda003f3fb97b6990b1d0dce1f9d27ab26641901d624b74ee6f96653d904d1c0eddaa853832274481a04fc183", stakingKey: "b3bb1f8ce82ca86be000f2b0b6c004dd2f5035b10df32898f63222a30f2418308c0a4612acb13fc16f9817a51ba9da200d5b8d736b9ac93388f988415d91087341c748d1c0ae0ba9178a8e4dca433b471aff3bc97214594c2e3c8802a9a65bfd", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0
```

### After transaction

#### Candidate nodes for next epoch - remains the same

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_candidate_nodes.cdc -n mainnet

Result: {2: {"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d": true, "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4": true}, 5: {}, 1: {}, 4: {}, 3: {}}
```

#### Proposed table - updated

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_proposed_table.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/proposed_table.txt
$ cat /tmp/proposed_table.txt | wc -l
440
$ cat /tmp/proposed_table.txt | grep "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
"0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
$ cat /tmp/proposed_table.txt | grep "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
```

#### Approved nodes - updated

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_approved_nodes.cdc -n mainnet -o json | jq '.value[] | .value' | sort > /tmp/approved_nodes.txt
$ cat /tmp/approved_nodes.txt | wc -l
391
$  cat /tmp/approved_nodes.txt  | grep "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
"0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"
$ cat /tmp/approved_nodes.txt  | grep "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"
```

#### Node Info - no change

```
$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "0b28fa535c88bb35cddbaa697468446b1ad4f85d38f5c8af84b4c1d45b982db4", role: 2, networkingAddress: "flow--mainnet--consensus--ff-1.staking.production.figment.io:3569", networkingKey: "3aadf137af728b0272892217ed54df3f4302a311df63db688bc6825ee7d82586702f6637879f6755d60b8fac8f2afd1f789dcceb61bacc8b82d1b33ba4a1a7c6", stakingKey: "8cbf2ae716f28a07bd631c4c92ee3d576f1ef62eb6262711d3fbdd6212ccec7457b70c9971e11e0d07bdbf35a187416212a44236f7f30298c92199fc6256a59da3cfe1f7cbafc574d85e1f96e98ee15d739d549212be9ba9724dc670d1a33021", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)

$ flow scripts execute  ./transactions/idTableStaking/scripts/get_node_info.cdc --args-json  '[{ "type":"String", "value":"4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d"}]' -n mainnet -o inline
A.8624b52f9ddcd04a.FlowIDTableStaking.NodeInfo(id: "4bf86d54f88bbe0998ae50b5168468ff7e194f90219dbe380bebe5bcd108192d", role: 2, networkingAddress: "flow--mainnet--consensus--fl-1.staking.production.figment.io:3569", networkingKey: "012d916da0fe76e4dd8e079ba63ee3061ad9cf6cda003f3fb97b6990b1d0dce1f9d27ab26641901d624b74ee6f96653d904d1c0eddaa853832274481a04fc183", stakingKey: "b3bb1f8ce82ca86be000f2b0b6c004dd2f5035b10df32898f63222a30f2418308c0a4612acb13fc16f9817a51ba9da200d5b8d736b9ac93388f988415d91087341c748d1c0ae0ba9178a8e4dca433b471aff3bc97214594c2e3c8802a9a65bfd", tokensStaked: 0.00000000, tokensCommitted: 500000.00000000, tokensUnstaking: 0.00000000, tokensUnstaked: 0.00000000, tokensRewarded: 0.00000000, delegators: [], delegatorIDCounter: 0, tokensRequestedToUnstake: 0.00000000, initialWeight: 0)
```
# Update Contracts

Upgrade to the `FungibleTokenMetadataViews` and `FlowToken` contracts
as per these PRs:

* https://github.com/onflow/flow-ft/pull/139
* https://github.com/onflow/flow-core-contracts/pull/370

Used this to generate args:

`cat "./FungibleTokenMetadataViews.cdc" | xxd -p -c0 | tr -d '\n'`

# Transaction 1

```
flow transactions send -n mainnet templates/update_contract.cdc --signer mainnet-ft update_contract.cdc --args-json "$(cat "./arguments-update-FungibleTokenMetadataViews.json")"
```

Signer: `FungibleToken` account: `0xf233dcee88fe0abe` 
with public key `3588eb28b60e28d24c1e8b03f9a00f73ebd3f6707ee813e27d58ecb6439b8dde1413d7a74a7cc7e8939cbef2e0aa6acc51d5c7010afdb4c6dba55d4cc2ca8bed`

## Result

Successful attempt: https://flowscan.org/transaction/

# Transaction 2

```
flow transactions send -n mainnet templates/update_contract_flow.cdc --signer mainnet-flow-token update_flow_set_uri.cdc --args-json "$(cat "./arguments-update-FlowToken.json")"
```

Signer: `FlowToken` account: `0x1654653399040a61` 
with public key `3588eb28b60e28d24c1e8b03f9a00f73ebd3f6707ee813e27d58ecb6439b8dde1413d7a74a7cc7e8939cbef2e0aa6acc51d5c7010afdb4c6dba55d4cc2ca8bed`


## Result

Successful attempt: https://flowscan.org/transaction/
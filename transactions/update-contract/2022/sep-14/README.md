# Update Contracts

These contract updates fix bugs which would preventing Automatic Rewards Payouts from working properly under certain circumstances. See [the commit related to these bugfixes](https://github.com/onflow/flow-core-contracts/commit/921e06812519195a088bf9b51538b5ca1dc4624e) for more information.

Both transactions will be signed by the staking account.

Lastly, the FlowToken contract will be upgraded with an optimization to reduce gas usage.

| Contract                                            | Arguments | Multisig Link   | Transaction |
|---------------------------------------              |----------                                                                                               |-----------------|-------------|
| [FlowEpoch.cdc](./FlowEpoch.cdc)                        | [arguments-update-contract-FlowEpoch.json](./arguments-update-contract-FlowEpoch.json)                  | [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) | [Sealed Transaction](https://flowscan.org/transaction/97075324ecad369d7cfa5913022d75067adab56ef9cdf2cb744da2b5f2b5babf) |
| [FlowIDTableStaking.cdc](./FlowIDTableStaking.cdc)  | [arguments-update-contract-FlowIDTableStaking.json](./arguments-update-contract-FlowIDTableStaking.json)| [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) | [Sealed Transaction](https://flowscan.org/transaction/d8ba795ea917758cc8e0c5c589069281293a9d5c77cc269fda429c5607c3a6e0) |
| [FlowToken.cdc](./FlowToken.cdc)  | [arguments-update-contract-FlowToken.json](./arguments-update-contract-FlowToken.json)| [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) | [Sealed Transaction](https://flowscan.org/transaction/147d450b560b16e14a2c816e0a329113a1eafd3bfa95707fb901c575320672e3) |


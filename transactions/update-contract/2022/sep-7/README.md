# Update Contracts

These contract updates fix bugs which would preventing Automatic Rewards Payouts from working properly under certain circumstances. See [the commit related to these bugfixes](https://github.com/onflow/flow-core-contracts/commit/921e06812519195a088bf9b51538b5ca1dc4624e) for more information.

Both transactions will be signed by the staking account.

| Contract                                            | Arguments | Multisig Link   | Transaction |
|---------------------------------------              |----------                                                                                               |-----------------|-------------|
| [FlowEpoch.cdc](./FlowEpoch.cdc)                        | [arguments-update-contract-FlowEpoch.json](./arguments-update-contract-FlowEpoch.json)                  | [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) |             |
| [FlowIDTableStaking.cdc](./FlowIDTableStaking.cdc)  | [arguments-update-contract-FlowIDTableStaking.json](./arguments-update-contract-FlowIDTableStaking.json)| [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) |


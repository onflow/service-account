# Burn Flow - Nov 14th

The Flow Service account will burn 9,792,568.00 FLOW
. These tokens are "Bonus Tokens" and 
are accounted for as part of the FlowToken.totalSupply but are *not considered* as part of
the FlowToken inflation while paying rewards.

The staking account also must update the record
of bonus tokens that are used to calculate epoch rewards.

## About Bonus Tokens

During the initial Flow launch two batches of tokens were created by the Gensis Account. These consisted of the initial Flow token supply and a second batch of 65mm tokens which are referred to as "Bonus Tokens." These 65mm tokens were withheld from the Flow Total Supply and distributed as locked tokens, only to be unlocked if the Flow mainnet launch milestones were NOT reached. "Bonus Tokens" were not considered included in "total supply" while calculating staking rewards. These milestones were all achieved, and the 65mm Bonus Tokens can now be destroyed. These locked tokens were not in circulation as they were not transferrable by the holding parties.

## Transaction 1

Burns the tokens. Must be authorized by the service account.

| Template                                                 | Arguments | Multisig Link   | Transaction |
|---                                                       |---        |---              |---          |
| [burn_flow.cdc](../../../../templates/burn_flow.cdc) | [arguments-burn-flow.json](./arguments-burn-flow.json) | [Burn Tokens](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=burn_flow.cdc&param=%5B%20%20%20%20%20%7B%20%20%20%20%20%20%20%20%20%22type%22:%20%22UFix64%22,%20%20%20%20%20%20%20%20%20%22value%22:%20%229792568.00%22%20%20%20%20%20%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) |


## Transaction 2

Sets the bonus token amount for the `FlowEpoch` smart contract.
Must be signed by the staking account.

| Template                                                 | Arguments | Multisig Link   | Transaction |
|---                                                       |---        |---              |---          |
| [set_bonus_tokens.cdc](../../../../templates/set_bonus_tokens.cdc) | [arguments-burn-flow.json](./arguments-burn-flow.json) | [Set Bonus Tokens Amount]() |



## Success
1. Transaction 1 - f46d16feb4a710c07cafb1f947195a210f29a98f60dd5f755f9246e662e9a2d9
2. Transaction 2 - 9ade257bbc8bd4216d90a140251269c16bb9ad69b256dcce3e89664c5f365560
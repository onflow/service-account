# Burn Flow - Nov 14th

Setting bonus tokens to zero in the epoch contract.

The bonus tokens should no longer be subtracted from the total supply for rewards calculation.

## About Bonus Tokens

During the initial Flow launch two batches of tokens were created by the Gensis Account. These consisted of the initial Flow token supply and a second batch of 65mm tokens which are referred to as "Bonus Tokens." These 65mm tokens were withheld from the Flow Total Supply and distributed as locked tokens, only to be unlocked if the Flow mainnet launch milestones were NOT reached. "Bonus Tokens" were not considered included in "total supply" while calculating staking rewards. These milestones were all achieved, and the 65mm Bonus Tokens can now be destroyed. These locked tokens were not in circulation as they were not transferrable by the holding parties.

## Transaction 

Burns the tokens. Must be authorized by the service account.

| Template                                                             | Arguments | Multisig Link   | Transaction |
|----------------------------------------------------------------------|---        |---              |---          |
| [burn_flow.cdc](../../../../templates/set_bonus_tokens_to_zero..cdc) |  | | |



## Success

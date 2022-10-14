# Burn Flow - Sep 21

The Flow Service account will burn 38,357,187 FLOW
. These tokens are "Bonus Tokens" and 
are accounted for as part of the FlowToken.totalSupply but are *not considered* as part of
the FlowToken inflation while paying rewards.

## About Bonus Tokens

During the initial Flow launch two batches of tokens were created by the Gensis Account. These consisted of the initial Flow token supply and a second batch of 65mm tokens which are referred to as "Bonus Tokens." These 65mm tokens were withheld from the Flow Total Supply and distributed as locked tokens, only to be unlocked if the Flow mainnet launch milestones were NOT reached. "Bonus Tokens" were not considered included in "total supply" while calculating staking rewards. These milestones were all achieved, and the 65mm Bonus Tokens can now be destroyed. These locked tokens were not in circulation as they were not transferrable by the holding parties.

## Transaction


| Template                                                 | Arguments | Multisig Link   | Transaction |
|---                                                       |---        |---              |---          |
| [burn_flow.cdc](../../../../templates/burn_flow.cdc) | [arguments-burn-flow.json](./arguments-burn-flow.json) | [Burn Tokens](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=burn_flow.cdc&param=%5B%7B%22type%22:%20%22UFix64%22,%20%22value%22:%20%2238357187.00%22%7D%20%5D&acct=0xe467b9dd11fa00df&limit=9999) | [Flowscan](https://flowscan.org/transaction/a0cfe6b5a2b013f536bd9957cd544630e415c95b98c413ef4a5e4f4d4e6b238a) |

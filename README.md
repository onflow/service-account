# Service Account Management

## Multi-sig process

Flow employs a **community-driven**, multi-signature process to execute essential protocol-level changes. This “multi-sig” process, essential to Flow's decentralized governance model, ensures that any modifications to key protocol state and parameters are only made through community consensus and collective agreement of multiple parties, providing an additional layer of security, trust and decentralization on the network.

Notably, the multi-sig process on Flow is associated with two principal accounts that oversee critical aspects of the Flow protocol: the service account, responsible for actions related to protocol parameters, and the staking account, which holds resources linked to staked nodes within the network. These accounts are collectively overseen by multiple signatories - representatives from the Flow ecosystem - who participate in meetings where transactions are simultaneously authorized (or rejected) and submitted only if there’s quorum. 

At present, representatives from FindLabs, Flow Foundation, and individual members (`@bluesign` and Layne) collectively hold multi-sig authority over the service account. Each signer is allocated a weight of 250 units, and to validate a transaction, a cumulative total of 1000 units is necessary. Therefore, a minimum of four signers must jointly provide their signatures to authorize the transaction. The transactions deliberated by these signatories may be related to setting transaction fees, managing/ slashing rewards, updating network-level contracts, adding new nodes, driving height coordinated and other node software upgrades, etc; see [account page](https://developers.flow.com/build/basics/accounts#service-accounts) for more details on the powers and abilities of the Flow service account.

## Role of a multi-signer

Multi-signers on Flow have a direct hand in shaping Flow’s future. They represent the community, oversee protocol changes, and ensure decisions align with the interests of all Flow participants. They regularly join meetings, some scheduled and others on short notice. On average and under normal circumstances, signers are expected to attend 1-2 meetings per month, each lasting about 10-15 minutes. During busier periods, such as major protocol updates, there may be more frequent and short-notice meetings.

## 🛠️ Service Committee
The group of multi-signers are effectively referred to as the service committee.

## 📋 Policy for Multi-signers
An efficient and smooth multi-sign process is essential to ensure upgrades on Flow are rolled out in a timely manner. Reviewing, approving, and signing transactions requires a time commitment from each member of the service committee.

Equally important is preserving the decentralized nature of the multi-sign process. The service committee must reflect the diversity and independence of the Flow ecosystem and avoid any form of centralization of signing power.

To that end, the following policy applies:

1. Meeting Participation
Each signer is expected to not miss more than 10 consecutive multi-signing meetings.

2. Inactive Signer Removal
If a signer exceeds this threshold, the rest of the committee may propose their removal through a governance FLIP.
The inactive key will be notified and have a grace period of two weeks to resolve any issue that may prevent them from signing

3. Decentralization Requirement
The multi-sign process must remain decentralized, and no single entity including the Flow Foundation and Dapper Labs, should be capable of unilaterally signing and submitting a transaction.

## How to nominate?

If you are currently a multi-signer, you may nominate someone to join as a multi-signer. To do so, submit a governance FLIP titled “*Addition of [Name/Handle] as a multi-sig signer*.” Ensure you follow the FLIP format and provide a clear motivation with thorough nomination details to enable full community deliberation. Find more information on creating a FLIP [here](https://github.com/onflow/flips/tree/main), and check out a sample nomination [here](https://github.com/onflow/flips/blob/main/governance/20231005-Adding-bluesign-as-multi-sig.md).

## Tool used to multi-sign
The multi-signers use this tool https://flow-multisig.vercel.app/ to sign and submit the transaction.

## How to Prepare a Transaction for the Service Account

If you have a proposal for a service account transaction, please follow these steps:

1. Almost all service account transactions require a FLIP or a discussion
   with the community and/or service account committee first 
   before being approved. Please open a FLIP or an issue
   in the repo first before creating the transaction.
2. If your FLIP or issue has been approved and a date
   has already be chosen for the multisig, create a new branch to propose
   your transaction. The transaction will likely be similar
   to an existing transaction, so first check if the operation
   you are proposing is already somewhere in the `transactions/` directory.
   If it is, create a new folder in that directory for the year and date
   that will be used for the transaction.
3. If your operation doesn't already exist, create a new folder
   in `transactions/` for your operation.
4. You can copy an existing directory for your transaction to use as a template,
   regardless of whether it is new or old.
5. If your transaction is one that will be used multiple times,
   put the Cadence code in the `templates/` directory. If you are sure
   it will only be executed once, put the Cadence code in your operation directory.
6. Fill out the `README.md` in your directory with all the instructions required
   for your operation. Make sure you create an arguments file for your transaction if your transaction requires arguments. Do not hard-code.
7. Ensure that your transaction has proper pre and post-conditions to verify
   that it executes properly. We have to be extremely careful to make sure
   that everything we do with the service account is done safely and properly.
8. If your transaction is new, test your transaction by putting it in a script
   and running the script. Scripts can access authorized account objects
   so can be used to test administrative transactions without requiring a multisig.
   A test script template is provided at `./templates/test_script.cdc` for you
   to fill in with your transactions specific logic.
9. Open a pull request (PR) with your transaction, arguments, and instructions and add other signers as reviewers.
10. Once the PR is approved, schedule a multisign call.

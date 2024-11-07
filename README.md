# Service Account Management

## Multi-sig process

Flow employs a robust process for executing protocol-level changes, requiring the collective agreement of multiple parties to sign and authorize transactions that trigger key event such as modification of protocol-level parameters. This is commonly referred to as the “multi-sig process”.

Notably, the multi-sig process on Flow is associated with two principal accounts that oversee critical aspects of the Flow protocol: the service account, responsible for actions related to protocol parameters, and the staking account, which holds resources linked to staked nodes within the network. These accounts are collectively overseen by multiple signatories - representatives from the Flow ecosystem - who participate in meetings where transactions are simultaneously authorized (or rejected) and submitted only if there’s quorum. 

At present, representatives from Animoca, Blocto, Flow Foundation, Find, FlowScan, Ichi.org, etc. collectively hold multi-sig authority over the service account. Each signer is allocated a weight of 250 units, and to validate a transaction, a cumulative total of 1000 units is necessary. Therefore, a minimum of four signers must jointly provide their signatures to authorize the transaction. The transactions deliberated by these signatories may be related to minting tokens, setting fees, slashing rewards, updating network-level contracts, etc; see [account page](https://developers.flow.com/build/basics/accounts#service-accounts) for more details on the powers and abilities of the Flow service account.

## Requirements for signers
- Git
- Flow CLI
- Google Cloud SDK

### Git

We will be using this Git repository as a means to pass transaction files back and forth, so you will need to clone it on your local machine.

If you do not have Git configured to authenticate with GitHub, [Github Desktop](https://desktop.github.com/) is likely the easiest way to get started

To ensure that it's properly installed, please `git pull` the main branch of this repository.

### Flow CLI

If you have homebrew:

```sh
brew install flow-cli
```

Otherwise, you'll have to follow the instructions [here](https://docs.onflow.org/flow-cli/install)

To ensure it's properlly installed, please run the following:

```sh
flow version
```

This should show you the latest version of the Flow CLI. The current flow.json and flow-staking.json require v0.37.0+. The latest version can be downloaded from [here](https://docs.onflow.org/flow-cli/). However, if you require an older version for Flow CLI, the previous versions of flow.json and flow-staking.json are available via the commit e21ab1a via

```git checkout e21ab1a -- flow.json flow-staking.json```

### Google Cloud SDK

If you have homebrew:

```sh
brew install --cask google-cloud-sdk
```

Otherwise, you'll have to follow the instructions [here](https://cloud.google.com/sdk/docs/install)

To ensure it's properlly installed, please run the following:

```sh
gcloud auth application-default login
```

This should pop up a tab in your browser asking you to authorize the SDK. If you're able to, then you're all set!

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
8. Open a PR with your transaction, arguments, and instructions and add Vishal,
   Kshitij, and any other Flow team or community members that are needed to review the transaction.


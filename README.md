# Service Account Management

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


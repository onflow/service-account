# Service Account Management

## Requirements
- Git
- Flow CLI
- Google Cloud SDK

### Git

We will be using this repo as a means to pass files back and forth, this means that you will need to have this repo cloned.

If you do not have git setup to interact with Github yet, [github desktop](https://desktop.github.com/) would likely be the easiest to get you started

To ensure it's properlly installed, please `git pull` the main branch of this repo

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

This should show you the latest version of the Flow CLI

### GCloud SDK

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

# Update FlowIDTableStaking Contract

> Feb 8th, 2023

Upgrade to the FlowIDTableStaking contract as per this [pull request](https://github.com/onflow/flow-core-contracts/pull/321) to include performance changes as well as features to support permissionless access nodes.

## Transaction

[upgrade-nodelists.cdc](./upgrade-nodelists.cdc)

The upgrade transaction however needs to be proposed by the staking contract account and payed by the service account
because the gas usage will likely go over the limit.
Currently, the [multi-sign vercel app](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) does not support transactions with different proposer and payer hence we have to execute this via the old method using the flow-cli.

Used this to generate args:

`cat "./FlowIDTableStaking.cdc" | xxd -p -c0 | tr -d '\n'`

## Sequence of signing: 
1. Vishal generates the Tx
2. Round one - Signing for staking account
   1. Bjarte signs with flow-staking.json
   2. Josh Signs with flow-staking.json
   3. Alex Signs with flow-staking.json
   4. Vishal Signs with flow-staking.json
3. Round two - - Signing for service account
   1. Bjarte signs with flow.json
   2. Josh Signs with flow.json
   3. Alex Signs with flow.json
   4. Vishal Signs with flow.json
4. Vishal submits the transaction

## Prerequisites
1. Latest version of the [flow-cli](https://developers.flow.com/tools/flow-cli).
2. [Gcloud cli](https://cloud.google.com/sdk/docs/install)
3. Contributor privilege to this repo.
4. Checkout this repo locally.
5. Open a terminal and go into the directory `service-account`

## Dapper Labs Builds

```sh
flow transactions build ./transactions/update-contract/2023/feb-8/upgrade_nodelists.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/feb-8/arguments-update-contract-FlowIDTableStaking-mainnet.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-unsigned.rlp
```

## Staking Account

## Bjarte Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-unsigned.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-1.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Alex Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-2.rlp \
  --config-path flow-staking.json \
  --signer alexgrach \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

---

## Service Account
## Bjarte Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-4.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Alex Signs

```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-6.rlp \
  --config-path flow.json \
  --signer alexgrach \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking for feb-8";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-complete.rlp
```

## Vishal Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/feb-8/upgrade-nodelists-feb-8-sig-complete.rlp
```

## Results
https://flowscan.org/transaction/11a3e45c89735a118db0ee9d2755f8050b0f4e1ac9e93de458cec3af0d89285f

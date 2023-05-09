# Move Staking and Epoch Admin Resources

> May , 2023

The admin resources for the staking and epoch smart contracts
need to be moved from the staking account to the service account.

## Transaction

[move-admin-resources.cdc](./move-admin-resources.cdc)

The transaction needs to be authorized by both the staking account and the service account,
so this will require the old way of signing.

## Sequence of signing: 
1. Vishal generates the Tx
2. Round one - Signing for staking account
   1. Bjarte signs with flow-staking.json
   2. Josh Signs with flow-staking.json
   3.  Signs with flow-staking.json
   4. Vishal Signs with flow-staking.json
3. Round two - - Signing for service account
   1. Bjarte signs with flow.json
   2. Josh Signs with flow.json
   3.  Signs with flow.json
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
flow transactions build ./transactions/move-admin-resources/may-2023/move-admin-resources.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-unsigned.rlp
```

## Staking Account

## Bjarte Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-unsigned.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-1.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

##  Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-2.rlp \
  --config-path flow-staking.json \
  --signer  \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
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
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-4.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

##  Signs

```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-6.rlp \
  --config-path flow.json \
  --signer  \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move admin resources for may";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-complete.rlp
```

## Vishal Submits

```sh
flow transactions send-signed --network mainnet ./transactions/move-admin-resources/may-2023/move-admin-resources-may-sig-complete.rlp
```

## Results
https://flowscan.org/transaction/

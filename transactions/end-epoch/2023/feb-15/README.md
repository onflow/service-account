# Move Tokes

> Feb 15th, 2023

Transaction to move tokens between staking buckets and enable staking because of
the mainnet EECC caused by a candidate node list bug

## Transaction

[move-tokens-candidate-zero.cdc](./move-tokens-candidate-zero.cdc)

The transaction however needs to be proposed by the staking contract account and payed by the service account
because the gas usage will likely go over the limit.
Currently, the [multi-sign vercel app](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) does not support transactions with different proposer and payer hence we have to execute this via the old method using the flow-cli.

Used this to generate args:

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
flow transactions build ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-unsigned.rlp
```

## Staking Account

## Bjarte Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-unsigned.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-1.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Alex Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-2.rlp \
  --config-path flow-staking.json \
  --signer alexgrach \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
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
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-4.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Alex Signs

```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-6.rlp \
  --config-path flow.json \
  --signer alexgrach \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "move tokens for feb-15";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-complete.rlp
```

## Vishal Submits

```sh
flow transactions send-signed --network mainnet ./transactions/end-epoch/2023/feb-15/move-tokens-candidate-zero-feb-15-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/b6d21fbc44b2090a671afb6c4728949ffbb04529099b95b0289d6762267b04d7
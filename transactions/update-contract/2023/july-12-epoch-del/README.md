# Update Epoch, LockedTokens, and FlowStakingCollection Contracts

> July 12th, 2023

Upgrade to all the Flow Epoch contracts, `LockedTokens`, and `FlowStakingCollection` as per this pull request:

- https://github.com/onflow/flow-core-contracts/pull/364

These include changes to enable delegator staking minimum
and move epoch admins to the service account.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowIDTableStaking`. Needs old way of signing.

2. Set delegator minimum to 50 and set moves pending list. Needs old way of signing.

[set_del_min.cdc](./set_del_min.cdc)

3. Upgrade `LockedTokens`.

4. Upgrade `FlowStakingCollection`.

5. Upgrade `FlowEpoch` and move admin objects. Needs old way of signing.

[upgrade_epoch_move_admins.cdc](./upgrade_epoch_move_admins.cdc)

Used this to generate the contract code arguments:

`cat "./{Filename}.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-contract-{Filename}-mainnet.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt {Filename}.cdc
(Should produce no difference)
```
___

# Transaction 1

## Transaction 1 Sequence of signing: 

Signer: flow-staking
Transaction: `templates/upgrade_contract.cdc`
Args: `arguments-update-Staking.json`

For this transaction we have to use the old way of signing because the web tool cannot generate a signing request ID if the transaction argument is too long.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `upgrade-contract.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Overview of sequence of signing:
1. Vishal generates the Tx (step 1)
2. Signing for staking account
   1. Vishal signs with flow-staking.json  (step 2)
   2. Josh Signs with flow-staking.json (step 3)
   3. Find Signs with flow-staking.json (step 4)
   4. Dmitrii Signs with flow-staking.json (step 5)
3. Vishal submits the transaction (step 6)


## Transaction 1 - Step 1 Vishal generates the Tx

```
flow transactions build ./templates/upgrade_contract.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/july-12-epoch-del/arguments-update-Staking.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0x8624b52f9ddcd04a \
  --gas-limit 9999
  -x payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-unsigned.rlp
```

## Transaction 1 - Step 2 Vishal Signs with staking account

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/update-staking-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-1.rlp
```

Push the unsgined RLP and the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 1 - Step 3 Josh Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 1 - Step 4 Find Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 1 - Step 5 Dmitrii Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-3.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-complete.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 1 - Step 6 Vishal submits the transaction

```
git pull
```

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-12-epoch-del/update-staking-sig-complete.rlp
```

### Results

Successful attempt:
https://flowscan.org/transaction/

___

# Transaction 2

## Transaction 2 Sequence of signing:

Signer: flow-staking
Transaction: `set_del_min.cdc`
Args: none

## Transaction 2 Sequence of signing: 

For this transaction we have to use the old way of signing because it is a multi-sig between the staking account and service account in order to have no gas limit

## Overview of sequence of signing: 
1. Vishal generates the Tx (step 1)
2. Round one - Signing for staking account
   1. Vishal signs with flow-staking.json  (step 2)
   2. Josh Signs with flow-staking.json (step 3)
   3. Find Signs with flow-staking.json (step 4)
   4. Dmitrii Signs with flow-staking.json (step 5)
3. Roune two - - Signing for service account
   1. Vishal signs with flow.json (step 6)
   2. Josh Signs with flow.json (step 7)
   3. Find Signs with flow.json (step 8)
   4. Dmitrii Signs with flow.json (step 9)
4. Vishal submits the transaction (step 10)


## Transaction 2 - Step 1 Vishal generates the Tx

```
flow transactions build ./transactions/update-contract/2023/july-12-epoch-del/set_del_min.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 999999
  -x payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-unsigned.rlp
```

## Transaction 2 - Step 2 Vishal Signs with staking account

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-1.rlp
```

Push the unsgined RLP and the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 3 Josh Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 4 Find Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 5 Dmitrii Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-3.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 6 Vishal Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-4.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 7 Josh Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 8 Find Signs with service account

```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-6.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "set del min transaction for july-12";git push origin main
```

## Transaction 2 - Step 9 Dmitrii Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-7.rlp \
  --config-path flow.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-complete.rlp
```

## Transaction 2 - Step 10 Vishal submits the transaction

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-12-epoch-del/set-del-min-sig-complete.rlp
```

## Results

Successful attempt:
https://flowscan.org/transaction/

___

# Transaction 3
## Transaction 3 Sequence of signing: 

1. A token admin signer executes the transaction from the command line manually:

```
flow transactions send -n mainnet --signer mainnet-locked upgrade_contract.cdc --args-json "$(cat "./arguments-update-LockedTokens.json")"
```

## Results

Successful attempt:
https://flowscan.org/transaction/

___
# Transaction 4
## Transaction 4 Sequence of signing: 

1. A token admin signer executes the transaction from the command line manually:

```
flow transactions send -n mainnet --signer mainnet-locked upgrade_contract.cdc --args-json "$(cat "./arguments-update-FlowStakingCollection.json")"
```

## Results

Successful attempt:
https://flowscan.org/transaction/

___
# Transaction 5

## Transaction 5 Sequence of signing: 

For this transaction we have to use the old way of signing because it is a multi-sig between the staking account and service account.

## Overview of sequence of signing: 
1. Vishal generates the Tx (step 1)
2. Round one - Signing for staking account
   1. Vishal signs with flow-staking.json  (step 2)
   2. Josh Signs with flow-staking.json (step 3)
   3. Find Signs with flow-staking.json (step 4)
   4. Dmitrii Signs with flow-staking.json (step 5)
3. Roune two - - Signing for service account
   1. Vishal signs with flow.json (step 6)
   2. Josh Signs with flow.json (step 7)
   3. Find Signs with flow.json (step 8)
   4. Dmitrii Signs with flow.json (step 9)
4. Vishal submits the transaction (step 10)


## Transaction 5 - Step 1 Vishal generates the Tx

```
flow transactions build ./transactions/update-contract/2023/july-12-epoch-del/upgrade_epoch_move_admins.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/july-12-epoch-del/arguments-update-FlowEpoch.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-unsigned.rlp
```

## Transaction 5 - Step 2 Vishal Signs with staking account

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-1.rlp
```

Push the unsgined RLP and the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 3 Josh Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 4 Find Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 5 Dmitrii Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-3.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 6 Vishal Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-4.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 7 Josh Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 8 Find Signs with service account

```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-6.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-12";git push origin main
```

## Transaction 5 - Step 9 Dmitrii Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-7.rlp \
  --config-path flow.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-complete.rlp
```

## Transaction 5 - Step 10 Vishal submits the transaction

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-12-epoch-del/upgrade-epoch-sig-complete.rlp
```

## Results

Successful attempt:
https://flowscan.org/transaction/


## Prerequisites
1. Latest version of the [flow-cli](https://developers.flow.com/tools/flow-cli).
2. [Gcloud cli](https://cloud.google.com/sdk/docs/install)
3. Contributor privilege to this repo.
4. Checkout this repo locally.
5. Open a terminal and go into the directory `service-account`
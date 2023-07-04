# Update Epoch, LockedTokens, and FlowStakingCollection Contracts

> July 5th, 2023

Upgrade to all the Flow Epoch contracts, `LockedTokens`, and `FlowStakingCollection` as per this pull request:

- https://github.com/onflow/flow-core-contracts/pull/364

These include changes to enable delegator staking minimum
and move epoch admins to the service account.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowClusterQC`, `FlowDKG`, and `FlowIDTableStaking`.

[upgrade_staking_qc_dkg.cdc](./upgrade_staking_qc_dkg.cdc)

2. Set delegator minimum to 50.

[set_del_min.cdc](./set_del_min.cdc)

3. Upgrade `LockedTokens`.

[upgrade_lockedtokens.cdc](upgrade_lockedtokens.cdc)

4. Upgrade `FlowStakingCollection`.

[upgrade_stakingcollection.cdc](upgrade_stakingcollection.cdc)

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
Transaction: `upgrade_staking_qc_dkg.cdc`
Args: `arguments-update-QCDKGStaking.json`

Have to use the old way of signing because tool does not currently support a large request body.

### Transaction 1 - Step 1 Flow team generates the Tx

flow transactions build ./transactions/update-contract/2023/july-5-epoch-del/upgrade_staking_qc_dkg.cdc \
--config-path flow-staking.json \
--network mainnet \
--args-json "$(cat "./transactions/update-contract/2023/july-5-epoch-del/arguments-update-QCDKGStaking.json")" \
--proposer 0x8624b52f9ddcd04a \
--proposer-key-index 5 \
--authorizer 0x8624b52f9ddcd04a \
--payer 0x8624b52f9ddcd04a \
-x payload \
--save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-unsigned.rlp

### Transaction 1 - Step 2 Vishal signs

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-1.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking, QC and DKG transaction for july 5th";git push origin main
```

### Transaction 1 - Step 3 Josh signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking, QC and DKG transaction for july 5th";git push origin main
```

### Transaction 1 - Step 4 Find signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking, QC and DKG transaction for july 5th";git push origin main
```

### Transaction 1 - Step 5 Dmitrii signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-3.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-complete.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade staking, QC and DKG transaction for july 5th";git push origin main
```

### Transaction 1 - Step 6 Flow submits

```sh
git pull
```

Submit the transaction
```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-5-epoch-del/upgrade-staking-qc-dkg-sig-complete.rlp
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

This transaction can be executed using the web tool.

1. Flow generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=&name=&param=%5B%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `set_del_min.cdc` transaction with the given args.

2. Signers sign with the web tool or using flow cli specifying the Signature Request ID

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

### Results

Successful attempt:
https://flowscan.org/transaction/

___
# Transaction 3
## Transaction 3 Sequence of signing: 

1. Josh executes the transaction from the command line manually:

```
flow transactions send -n mainnet --signer mainnet-locked upgrade_lockedtokens.cdc --args-json "$(cat "./arguments-update-LockedTokens.json")"
```

## Results

Successful attempt:
https://flowscan.org/transaction/

___
# Transaction 4
## Transaction 4 Sequence of signing: 

1. Josh executes the transaction from the command line manually:

```
flow transactions send -n mainnet --signer mainnet-locked upgrade_stakingcollection.cdc --args-json "$(cat "./arguments-update-FlowStakingCollection.json")"
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
flow transactions build ./transactions/update-contract/2023/july-5-epoch-del/upgrade_epoch_move_admins.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2023/july-5-epoch-del/arguments-update-FlowEpoch.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-unsigned.rlp
```

## Transaction 5 - Step 2 Vishal Signs with staking account

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-unsigned.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-1.rlp
```

Push the unsgined RLP and the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 3 Josh Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-1.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 4 Find Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-2.rlp \
  --config-path flow-staking.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 5 Dmitrii Signs with staking account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-3.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 6 Vishal Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-4.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 7 Josh Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-5.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 8 Find Signs with service account

```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-6.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Transaction 5 - Step 9 Dmitrii Signs with service account

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-7.rlp \
  --config-path flow.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-complete.rlp
```

## Transaction 5 - Step 10 Vishal submits the transaction

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-complete.rlp
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
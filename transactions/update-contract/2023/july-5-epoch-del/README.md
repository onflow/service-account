# Update Epoch, LockedTokens, and FlowStakingCollection Contracts

> July 5th, 2023

Upgrade to all the Flow Epoch contracts, `LockedTokens`, and `FlowStakingCollection` as per this pull request:

- https://github.com/onflow/flow-core-contracts/pull/364

These include changes to enable delegator staking minimum
and move epoch admins to the service account.

## Transactions

This upgrade has to be completed in multiple transactions:

1. Upgrade `FlowClusterQC`, `FlowDKG`, and `FlowIDTableStaking` and set delegator minimum to 50.

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

## Transaction 1 Sequence of signing: 

1. Flow generates the Signature Request ID on the [site]() for the `upgrade_staking_qc_dkg.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

### Results

Successful attempt:
https://flowscan.org/transaction/

## Transaction 2 Sequence of signing: 

1. Flow generates the Signature Request ID on the [site]() for the `set_del_min.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

### Results

Successful attempt:
https://flowscan.org/transaction/

## Transaction 3 Sequence of signing: 

1. Flow generates the Signature Request ID on the [site]() for the `upgrade_lockedtokens.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Results

Successful attempt:
https://flowscan.org/transaction/

## Transaction 4 Sequence of signing: 

1. Flow generates the Signature Request ID on the [site]() for the `upgrade_stakingcollection.cdc` transaction with the given args.

2. Signers sign with flow cli specifying the Signature Request ID
`bash multisig.sh -f flow.json <Signature Request ID>`

3. [Site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) submits the transaction

## Results

Successful attempt:
https://flowscan.org/transaction/


## Transaction 5 Sequence of signing: 

Must use the old way of signing because it is a multisig between the staking account and service account.

## Sequence of signing: 
1. Vishal generates the Tx
2. Round one - Signing for staking account
   1. Josh signs with flow-staking.json
   2. Dmitrii Signs with flow-staking.json
   3. Emerson Signs with flow-staking.json
   4. Vishal Signs with flow-staking.json
3. Roune two - - Signing for service account
   1. Josh signs with flow.json
   2. Dmitrii Signs with flow.json
   3. Emerson Signs with flow.json
   4. Vishal Signs with flow.json
4. Vishal submits the transaction

## Prerequisites
1. Latest version of the [flow-cli](https://developers.flow.com/tools/flow-cli).
2. [Gcloud cli](https://cloud.google.com/sdk/docs/install)
3. Contributor privilege to this repo.
4. Checkout this repo locally.
5. Open a terminal and go into the directory `service-account`

## Flow Builds

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


## Staking Account

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-unsigned.rlp \
  --config-path flow-staking.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-1.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Dmitrii Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-1.rlp \
  --config-path flow-staking.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-2.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Emerson Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-2.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-3.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-4.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

---

## Service Account

## Josh Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-4.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-5.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Dmitrii Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-5.rlp \
  --config-path flow.json \
  --signer dmitrii \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-6.rlp
```


Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Emerson Signs

```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-6.rlp \
  --config-path flow.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-7.rlp
```

Push the vote to git
```sh
git add .;git commit -m "upgrade epoch transaction for july-5";git push origin main
```

## Vishal Signs

Pull the transaction from git
```sh
git pull
```

Sign the transaction using Google Auth
```sh
flow transactions sign ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-complete.rlp
```

## Vishal Submits

```sh
flow transactions send-signed --network mainnet ./transactions/update-contract/2023/july-5-epoch-del/upgrade-epoch-sig-complete.rlp
```

## Results

Successful attempt:
https://flowscan.org/transaction/



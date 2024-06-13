# Update FlowServiceAccount Contract to add the reference to DependencyAudit contract

> June 13th, 2024

Upgrade to the `‘FlowServiceAccount` contract

See issue: https://github.com/onflow/service-account/issues/294

## Transactions

1. Upgrade `FlowServiceAccount`.

Needs to be signed with the service account.

Used this to generate the contract code arguments:

`cat "./FlowServiceAccount.cdc" | xxd -p | tr -d '\n'`

Verified using:
```
$ cat arguments-update-FlowServiceAccount.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt FlowServiceAccount.cdc
(Should produce no difference)
```
___


[Multisign link](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet)




### Results

Successful attempt:
https://www.flowdiver.io/tx/5b93c930144ab43b8edbe5088147eeb59c981e6380c45e44406ca4d599e20134

___


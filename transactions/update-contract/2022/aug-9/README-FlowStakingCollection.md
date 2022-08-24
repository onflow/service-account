# Update FlowStakingCollection.cdc

> 2022 aug-9

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/797b149ceaaa/contracts/FlowStakingCollection.cdc

## Transaction

:exclamation: Must paste the arguments from: [arguments-update-contract-FlowStakingCollection.json](./arguments-update-contract-FlowStakingCollection.json)

[Send Transction using Multisig tool](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&acct=0x8d0e87b65159ae63&limit=9999)

## Fallback
### Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/aug-9/arguments-update-contract-FlowStakingCollection.json")" \
  --proposer 0x8d0e87b65159ae63 \
  --proposer-key-index 0 \
  --authorizer 0x8d0e87b65159ae63 \
  --authorizer 0x8d0e87b65159ae63 \
  --payer 0x8d0e87b65159ae63 \
  -x payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-unsigned.rlp
```

### TODO Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-unsigned.rlp \
  --config-path flow.json \
  --signer TODO \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-sig-1.rlp
```

### Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-sig-1.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/update-contract/2022/aug-9/update-contract-FlowStakingCollection-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/9906840e86b18af87be553a06630643496640cd9f602b0b647359ca84e11e302

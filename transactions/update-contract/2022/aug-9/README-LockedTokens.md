# Update LockedTokens.cdc

> 2022 aug-9

## Contract to be deployed

https://github.com/onflow/flow-core-contracts/797b149ceaaa/contracts/LockedTokens.cdc

## Transaction
:exclamation: Paste params from [arguments-update-contract-LockedTokens.json](./arguments-update-contract-LockedTokens.json)

[Send Transction using Multisig tool](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=update_contract.cdc&param=%7B%7D&acct=0x8d0e87b65159ae63&limit=9999)

## Fallback

### Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/update-contract/2022/aug-9/arguments-update-contract-LockedTokens.json")" \
  --proposer 0x8d0e87b65159ae63 \
  --proposer-key-index 0 \
  --authorizer 0x8d0e87b65159ae63 \
  --authorizer 0x8d0e87b65159ae63 \
  --payer 0x8d0e87b65159ae63 \
  -x payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-unsigned.rlp
```

### TODO Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-unsigned.rlp \
  --config-path flow.json \
  --signer TODO \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-sig-1.rlp
```

### Contract Admin Signs

```sh
flow transactions sign ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-sig-1.rlp \
  --config-path flow.json \
  --signer contract-admin \
  --filter payload \
  --save ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-sig-complete.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/update-contract/2022/aug-9/update-contract-LockedTokens-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/

# Deploy Node Version Beacon Contract

> April 24th, 2023

[site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=deploy_contract_node_version_beacon.cdc&param=%5B%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%222000%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%22460000%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%20%22UInt64%22,%20%09%09%22value%22:%20%22483000%22%20%09%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999)

## Fallback (if signing using the site does not work)
### Dapper Labs Builds

```sh
flow transactions build ./templates/deploy_contract_node_version_beacon.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/node-version-beacon/2023/apr-24/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy-contract-node-version-beacon-unsigned.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet --config-path flow-staking.json ./transactions/adjust-epoch-length/2023/mar-30/adjust-epoch-length-mar-30-sig-complete.rlp
```
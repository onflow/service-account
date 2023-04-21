# Deploy Node Version Beacon Contract

> April 24, 2023

[pull request](https://github.com/onflow/service-account/pull/235)

## Transaction


| Contract                                                                                           | Arguments                                                                                      | Multisig Link   | Transaction |
|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|-----------------|-------------|
| [deploy_contract_node_version_beacon.cdc](../../../../templates/deploy_contract_node_version_beacon.cdc) | [arguments.json](./arguments.json) | [Update Contract](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet) | [Sealed Transaction](https://flowscan.org/transaction/) |



Used this to generate args:

`cat "../../../../templates/deploy_contract_node_version_beacon.cdc" | xxd -p -c0 | tr -d '\n'`

Verified using:
```
$ cat arguments.json | jq '.[] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt NodeVersionBeacon.cdc
(Should produce no difference)
```

> Tools is unable to generate the link since the argument content is too large. We will have to do this using the old way using `flow cli`

## Fallback (if signing using the site does not work)
### Dapper Labs Builds

```sh
flow transactions build ./templates/deploy_contract_node_version_beacon.cdc \
  --config-path flow.json \
  --network mainnet \
  --args-json "$(cat "./transactions/node-version-beacon/2023/apr-24/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon_apr_24-unsigned.rlp
```

## Josh Signs

```sh
flow transactions sign ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-unsigned.rlp \
  --config-path flow.json \
  --signer josh \
  --filter payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-1.rlp
```

## Bjarte Signs

```sh
flow transactions sign ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-1.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-2.rlp
```

## Chris Signs

```sh
flow transactions sign ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-2.rlp \
  --config-path flow.json \
  --signer chris \
  --filter payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-3.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-4.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path flow.json --network mainnet ./transactions/node-version-beacon/2023/apr-24/deploy_contract_node_version_beacon-apr-24-sig-4.rlp
```

## Results

https://flowscan.org/transaction/
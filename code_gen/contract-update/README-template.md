# Update Flow Cluster QC Contract

> ${DATE_TEXT}

## Contract to be deployed

${CONTRACT_LINK}

## Dapper Labs Builds

```sh
flow transactions build ./templates/update_contract.cdc \
  --config-path ${CONFIG_PATH} \
  --network mainnet \
  --args-json "$(cat "${ARG_PATH}")" \
  --proposer ${PAYER_ADDRESS} \
  --proposer-key-index 0 \
  --authorizer ${PAYER_ADDRESS} \
  --authorizer ${PAYER_ADDRESS} \
  --payer ${PAYER_ADDRESS} \
  -x payload \
  --save ${RLP_PATH}-unsigned.rlp
```

## TODO Signs

```sh
flow transactions sign ${RLP_PATH}-unsigned.rlp \
  --config-path ${CONFIG_PATH} \
  --signer TODO \
  --filter payload \
  --save ${RLP_PATH}-sig-1.rlp
```

## Contract Admin Signs

```sh
flow transactions sign ${RLP_PATH}-sig-1.rlp \
  --config-path ${CONFIG_PATH} \
  --signer contract-admin \
  --filter payload \
  --save ${RLP_PATH}-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --config-path ${CONFIG_PATH} --network mainnet ${RLP_PATH}-sig-complete.rlp
```


## Results

https://flowscan.org/transaction/
# Enable permissionless contract deployment
> July 5th, 2022

## Dapper Labs Builds

```sh
flow transactions build ./templates/set_contract_deployment_restricted.cdc \
  --network mainnet \
  --args-json "$(cat "./transactions/set-permissionless/jul-5/arguments.json")" \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 11 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-unsigned.rlp
```

## Layne Signs

```sh
flow transactions sign ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-unsigned.rlp \
  --signer layne \
  --filter payload \
  --save ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-1.rlp
```

## Animoca Signs

```sh
flow transactions sign ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-1.rlp \
  --signer animoca \
  --filter payload \
  --save ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-2.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-2.rlp \
  --signer peter \
  --filter payload \
  --save ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-3.rlp
```

## Kan Signs

```sh
flow transactions sign ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-3.rlp \
  --signer kan \
  --filter payload \
  --save ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/set-permissionless/jul-5/set-permissionless-jul-5-sig-complete.rlp
```

## Results

https://flowscan.org/transaction/

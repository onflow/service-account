# Reset Epoch

> Aug 25th, 2022

## New method using flow cli and multi-sign site

1. DapperLabs generates the Signature Request ID on the [site](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=serviceAccount&name=reset_epoch_with_end_staking_auction.cdc&param=%5B%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%2238%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22String%22,%20%09%09%22value%22:%22d4713cbe010d0da3b8d9a621b688a146%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22Optional%22,%20%09%09%22value%22:null%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%220%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%22426399%22%20%09%7D,%20%09%7B%20%09%09%22type%22:%22UInt64%22,%20%09%09%22value%22:%22447719%22%20%09%7D%20%5D&acct=0x8624b52f9ddcd04a&limit=9999) for the `reset_epoch_with_end_staking_auction.cdc` transaction with the given args.

2. Signers sign with flow-cli specifying the Signature Request ID

3. Site submits the transaction when sufficient signatures have been received.

## Old method (Fallback)

## Dapper Labs Builds

```sh
flow transactions build ./templates/reset_epoch_with_end_staking_auction.cdc \
  --config-path flow-staking.json \
  --network mainnet \
  --args-json "$(cat "./transactions/reset-epoch/2022/aug-25/arguments.json")" \
  --proposer 0x8624b52f9ddcd04a \
  --proposer-key-index 5 \
  --authorizer 0x8624b52f9ddcd04a \
  --payer 0xe467b9dd11fa00df \
  --gas-limit 1000000 \
  -x payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-unsigned.rlp
```

## Staking Account

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-unsigned.rlp \
  --config-path flow-staking.json \
  --signer ichi \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-1.rlp \
  --config-path flow-staking.json \
  --signer flowscan \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-2.rlp
```
## Animoca Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-2.rlp \
  --config-path flow-staking.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-3.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-3.rlp \
  --config-path flow-staking.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-4.rlp
```

---

## Service Account
## Find Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-4.rlp \
  --config-path flow.json \
  --signer find \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-5.rlp
```

## Animica Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-5.rlp \
  --config-path flow.json \
  --signer animoca \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-6.rlp
```

## Peter Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-6.rlp \
  --config-path flow.json \
  --signer peter \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-7.rlp
```

## Vishal Signs

```sh
flow transactions sign ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-7.rlp \
  --config-path flow.json \
  --signer vishal \
  --filter payload \
  --save ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-complete.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/reset-epoch/2022/aug-25/reset-epoch-aug-25-sig-complete.rlp
```

## Results

Failed
https://flowscan.org/transaction/



# End Epoch
> April 27, 2021

## Build

```sh
flow transactions build ./templates/end_epoch_change_payout.cdc \
  --network mainnet \
  --proposer 0xe467b9dd11fa00df \
  --proposer-key-index 4 \
  --authorizer 0xe467b9dd11fa00df \
  --payer 0xe467b9dd11fa00df \
  -x payload \
  --save end-epoch-apr-27-1.rlp
```

## Jan 12th - Service account token transfers

## TX 1: to move all FLOW from the Service Account COA to its cadence vault

Tested using
```
flow scripts execute ./test_script_for_bridge_tokens_from_evm.cdc  --args-json "$(cat "./bridge_tokens_from_evm_USDF.json")" -n mainnet
```

## TX 2: to move all USDF from the Service Account COA to its cadence vault

## TX 3, 4 and 5: USDF, stgUSDC and TRUMP from the Service Account cadence vault to 0x56dfc6b70135c5cd

```
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_stgUSDC_SA_to_ff.json")" -n mainnet
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_TRUMP_SA_to_ff.json")" -n mainnet
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_USDF_SA_to_ff.json")" -n mainnet
```



## Jan 12th - Service account token transfers

## TX 1: to move all FLOW from the Service Account COA to its cadence vault

Result:
Failure: https://www.flowscan.io/tx/8d43284d6b3dc9e5096e137ad37824e1f643997fc06964f9d8d56c136e4cc3b6
Success: https://www.flowscan.io/tx/a34b3fb9aa93a0a75a7b5da380f17118c114d992941d8465cf5eace263d50029

## TX 2: to move all USDF from the Service Account COA to its cadence vault
Result: https://www.flowscan.io/tx/e4523fe6615193a164c6175ff7d626b46b92e73606d2c69829e5898053fd1caa

Tested using
```
flow scripts execute ./test_script_for_bridge_tokens_from_evm.cdc  --args-json "$(cat "./bridge_tokens_from_evm_USDF.json")" -n mainnet
```

## TX 3, 4 and 5: USDF, stgUSDC and TRUMP from the Service Account cadence vault to 0x56dfc6b70135c5cd

```
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_stgUSDC_SA_to_ff.json")" -n mainnet
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_TRUMP_SA_to_ff.json")" -n mainnet
 flow scripts execute ./test_script_for_transfer_ft_SA_to_ff.cdc  --args-json "$(cat "./transfer_USDF_SA_to_ff.json")" -n mainnet
```
1 FLOW Token transfer: https://www.flowscan.io/tx/aa0a23cbda225e4f528982ba2785d1a4f5151d30c2ea5c45bc938ca1bb45c066

TRUMP transfer: https://www.flowscan.io/tx/aa0a23cbda225e4f528982ba2785d1a4f5151d30c2ea5c45bc938ca1bb45c066

USDC failed: https://www.flowscan.io/tx/a29cc1ce9df006ac80e0d9861ea70f71019f000943e6755a7dbf2fbc90324d54
USDC success: https://www.flowscan.io/tx/ef180bdc1579701602e7f19812d046a97ed10aa6132f78a4f00a90a6dee9c461

stgUSDC https://www.flowscan.io/tx/29ac7393cc1ba6177243cb09322a67efc2244eb8cdfccc8e7ed49c778e59cc89

USDF: https://www.flowscan.io/tx/b336fa2dc35890b884bc1615fc19e85d3957970f21f6c397567ed1d5efc59a14




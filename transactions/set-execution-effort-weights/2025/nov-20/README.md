# Set Execution Effort Weights

> Nov 20th, 2025

Et the new execution effort weights in accordance of [FLIP 346: Variable Transaction Fees - Execution Effort II.](https://github.com/onflow/flips/pull/347)

Should be signed with the service account.

The weights are

| Feature                        | weight  |
| ------------------------------ | ------- |
| create_account                 | 2143437 |
| blsverify_pop                  | 1538600 |
| get_account_balance            | 485476  |
| blsaggregate_public_keys       | 402728  |
| get_storage_capacity           | 397087  |
| get_account_available_balance  | 375235  |
| update_account_contract_code   | 369407  |
| blsaggregate_signatures        | 325309  |
| generate_account_local_id      | 75507   |
| get_account_contract_names     | 32771   |
| get_storage_used               | 25416   |
| account_keys_count             | 24709   |
| allocate_slab_index            | 15372   |
| atree_map_get                  | 8837    |
| atree_map_remove               | 7373    |
| create_array_value             | 4364    |
| create_dictionary_value        | 3818    |
| atree_map_set                  | 3656    |
| atree_array_insert             | 3652    |
| atree_map_read_iteration       | 3325    |
| encode_event                   | 2911    |
| transfer_composite_value       | 2358    |
| atree_array_append             | 1907    |
| statement                      | 1770    |
| atree_array_set                | 1737    |
| function_invocation            | 1399    |
| atree_map_pop_iteration        | 1210    |
| atree_array_pop_iteration      | 736     |
| rlpdecoding                    | 516     |
| graphemes_iteration            | 278     |
| ufix_parse                     | 257     |
| fix_parse                      | 223     |
| loop                           | 179     |
| atree_array_batch_construction | 177     |
| transfer_dictionary_value      | 125     |
| big_int_parse                  | 69      |
| transfer_array_value           | 48      |
| set_value                      | 48      |
| uint_parse                     | 31      |
| int_parse                      | 28      |
| get_value                      | 23      |
| string_to_lower                | 5       |
| evmgas_usage                   | 3       |

weight is experessesd in units of  1/(2^16) computaion (a full transaction is 9999 * 2^16 units).


Transaction to execute: [set_execution_effort_weights.cdc](../../../../templates/set_execution_effort_weights.cdc)

## Result

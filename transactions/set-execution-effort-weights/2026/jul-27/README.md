# Set Execution Effort Weights

> Jul 27th, 2026

Set the new execution effort weights in accordance with [FLIP 370: Execution Effort Calibration III.](https://github.com/onflow/flips/blob/main/protocol/20260611-execution-effort-3.md) (#461)

Should be signed with the service account.

Already executed on testnet on Jul 22nd, 2026: [127a3c745be392e08f37e569cdd2ad1128f753f86ce47a40b0717c6486dcd986](https://testnet.flowscan.io/tx/127a3c745be392e08f37e569cdd2ad1128f753f86ce47a40b0717c6486dcd986)

The weights are

| Feature                              | weight   |
| ------------------------------------ | -------- |
| blsaggregate_public_keys             | 63851230 |
| blsaggregate_signatures              | 45031044 |
| create_account                       | 15751197 |
| blsverify_pop                        | 9888886  |
| update_account_contract_code         | 1923478  |
| get_account_balance                  | 1828131  |
| get_storage_capacity                 | 1497945  |
| get_account_available_balance        | 1443208  |
| verify_signature                     | 627265   |
| generate_account_local_id            | 249708   |
| destroy_array_value                  | 155788   |
| get_storage_used                     | 147167   |
| get_account_contract_names           | 135863   |
| account_keys_count                   | 103486   |
| encode_event                         | 46569    |
| atree_map_has                        | 46122    |
| atree_array_get                      | 42997    |
| allocate_slab_index                  | 36924    |
| atree_map_get                        | 35646    |
| generate_uuid                        | 31935    |
| atree_map_set                        | 26932    |
| atree_array_insert                   | 22087    |
| atree_map_remove                     | 20860    |
| hash                                 | 20801    |
| create_array_value                   | 20072    |
| atree_map_construction               | 12342    |
| atree_array_append                   | 12291    |
| atree_map_read_iteration             | 10864    |
| function_invocation                  | 10547    |
| atree_map_batch_construction         | 8289     |
| destroy_dictionary_value             | 7533     |
| atree_array_set                      | 7199     |
| create_composite_value               | 6704     |
| statement                            | 5610     |
| loop                                 | 4467     |
| atree_array_pop_iteration            | 2052     |
| ufix_parse                           | 1807     |
| rlpdecoding                          | 1791     |
| fix_parse                            | 1508     |
| graphemes_iteration                  | 1245     |
| big_int_parse                        | 1102     |
| uint_parse                           | 833      |
| atree_array_batch_construction       | 830      |
| int_parse                            | 742      |
| atree_array_single_slab_construction | 534      |
| evmdecode_abi                        | 399      |
| word_slice_operation                 | 353      |
| get_value                            | 247      |
| set_value                            | 30       |
| string_to_lower                      | 24       |
| evmgas_usage                         | 7        |

weight is expressed in units of 1/(2^16) computation (a full transaction is 9999 * 2^16 units).

Compared to the previous weights ([#400](https://github.com/onflow/service-account/pull/400) as amended by [#441](https://github.com/onflow/service-account/pull/441)): 38 kinds re-weighted, 13 kinds newly priced, 5 kinds removed (see the FLIP for the full comparison).

Transaction to execute: [set_execution_effort_weights.cdc](../../../../templates/set_execution_effort_weights.cdc)

## Result

TBD

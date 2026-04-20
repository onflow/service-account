# Set Execution Effort Weights

> Apr 7th, 2026

Update execution effort weights to account for the shifting of some of the weight ids because of the changes in [cadence commit e1e6728](https://github.com/onflow/cadence/commit/e1e672891f9b05536a7b98dfee502bd52d4d73a3).

Should be signed with the service account.

## Diff from previous weights (PR #400)

The weight values are unchanged. The only difference is a renumbering of the atree map ComputationKind IDs. The same weight values shifted by +1 in key space (`1223-1227` → `1224-1228`):

| old key | new key | weight |
| ------- | ------- | ------ |
| 1223    | 1224    | 8837   |
| 1224    | 1225    | 3656   |
| 1225    | 1226    | 7373   |
| 1226    | 1227    | 3325   |
| 1227    | 1228    | 1210   |

Verify with:
```bash
diff <(jq -r '.[0].value[] | "\(.key.value)\t\(.value.value)"' transactions/set-execution-effort-weights/2025/nov-20/arguments.json) \
     <(jq -r '.[0].value[] | "\(.key.value)\t\(.value.value)"' transactions/set-execution-effort-weights/2026/apr-7/arguments.json)
```

Transaction to execute: [set_execution_effort_weights.cdc](../../../../templates/set_execution_effort_weights.cdc)

## Result

Transaction ID: https://www.flowscan.io/tx/f025b177539041c242f212a0eddda2915e2faeb0abddce5ff2ddff94f33b92cf
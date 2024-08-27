# Stage dependency contract

> Aug 27th, 2024

Issue: https://github.com/onflow/service-account/issues/309

Transaction to execute: [stage_dependency_contract.cdc(./stage_dependency_contract.cdc)

Used this to generate args:

`cat "./DependencyAudit.cdc" | xxd -p -c0 | tr -d '\n'`

Verified using:
```
$ cat arguments.json | jq '.[1] | .value' | xxd -r -p > /tmp/temp.txt
$ diff /tmp/temp.txt DependencyAudit.cdc
(Should produce no difference)
```

## Result

# Implementation of FLIP 315

This transaction is to implement [FLIP 315](https://github.com/onflow/flips/pull/315)

##  Transaction to execute

Key to remove:
1. Service account Index 7
2. Staking account Index 1

### Transaction for service account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 7)
    }
}
```

### Transaction for staking account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 1)
    }
}
```

----

## Result:

1. Transaction for service account


2. Transaction for staking account

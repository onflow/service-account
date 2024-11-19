# FLIP 310: Removing Equilibrium as multi-signer

This transaction is to implement the [FLIP 310](https://github.com/onflow/flips/pull/311)

##  Transaction to execute

Key to remove: 
1. Service account Index 8
2. Staking account Index 2

### Transaction for service account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 8)
    }
}
```

### Transaction for staking account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 2)
    }
}
```

## Result:

1. Transaction for service account


2. Transaction for staking account
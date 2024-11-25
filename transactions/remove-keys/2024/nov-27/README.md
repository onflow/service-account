# Implementation of FLIP 310 and FLIP 311

This transaction is to implement [FLIP 310](https://github.com/onflow/flips/pull/311) and [FLIP 311](https://github.com/onflow/flips/pull/312)

##  Transaction to execute

Key to remove: 
1. Service account Index 8 and 10
2. Staking account Index 2 and 4

### Transaction for service account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 8)
        signer.keys.revoke(keyIndex: 10)
    }
}
```

### Transaction for staking account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 2)
        signer.keys.revoke(keyIndex: 4)
    }
}
```

## Result:

1. Transaction for service account


2. Transaction for staking account
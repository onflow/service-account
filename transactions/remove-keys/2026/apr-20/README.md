# Implementation of FLIP 365

This transaction is to implement [FLIP 365](https://github.com/onflow/flips/pull/366)

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

1. Transaction for service account - https://www.flowscan.io/tx/42b9c46973536d3ed63ccae0a5db7787a8606935bdf149e912999203f4a779ad
2. Transaction for staking account - https://www.flowscan.io/tx/fdbb81f16bbb4ee05e72a9dec40ddb24d5ce0d332078302b76b7e726e9f6bdeb

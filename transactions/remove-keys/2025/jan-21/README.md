# Removing key at index 15 belonging to Flowscan

There is still an active key for FlowScan at index 15 although FlowScan is no longer a signer.
This transaction is to remove the key at index 15.

##  Transaction to execute

Key to remove: Service account Key Index 15

### Transaction for service account

```
transaction {
    prepare(signer: auth(RevokeKey) &Account) {
        signer.keys.revoke(keyIndex: 15)
    }
}
```

## Result:
https://www.flowscan.io/tx/3c20d713d686fcd4d63a360cf892afbc04fed8dd6950e48c2654c3c7d27e4032
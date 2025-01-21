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

import "FungibleToken"
import "FungibleTokenMetadataViews"
import "MetadataViews"
import "RetrieveFraudulentTokensEvents"

/// This transaction revokes the key at index 0 of the four input accounts.
transaction() {

    prepare(serviceAccount: &Account,
        attackerAccount1: auth(RevokeKey) &Account,
        attackerAccount2: auth(RevokeKey) &Account,
        attackerAccount3: auth(RevokeKey) &Account,
        attackerAccount4: auth(RevokeKey) &Account) {

        attackerAccount1.keys.revoke(keyIndex: 0)
        attackerAccount2.keys.revoke(keyIndex: 0)
        attackerAccount3.keys.revoke(keyIndex: 0)
        attackerAccount4.keys.revoke(keyIndex: 0)
    }
}

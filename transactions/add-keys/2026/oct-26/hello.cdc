// Hello-world test transaction for the Flow Foundation AWS KMS migration.
//
// Purpose: after Vishal's AWS KMS pubkey is registered on-chain at a new
// index on the service account (via the oct-26 add_keys ceremony), this
// trivial transaction is signed by Vishal using his AWS-backed flow.json
// entry. If it seals, we have proven end-to-end on mainnet that:
//   1. flow-cli's aws-kms key type correctly reaches AWS KMS.
//   2. AWS KMS produces a valid ECDSA signature over the transaction
//      envelope.
//   3. The on-chain verifier accepts the signature against the just-added
//      pubkey.
//
// The transaction has no state effect — just logs. It uses the service
// account as the authorizer so Vishal's envelope signature contributes
// weight to that account; three additional signers (any combination
// totaling 750+ weight) sign alongside to close the envelope.

transaction {
    prepare(signer: &Account) {
        log("Flow Foundation AWS KMS migration — slot 1 (Vishal) smoke test from service account")
        log(signer.address)
    }
}

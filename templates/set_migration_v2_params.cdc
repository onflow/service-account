import AccountV2Migration from 0xe467b9dd11fa00df

transaction(batchSize: UInt64, maxAddressIndex: UInt64) {
    prepare(signer: auth(Storage) &Account) {
        let admin = signer.storage
            .borrow<&AccountV2Migration.Admin>(
                from: AccountV2Migration.adminStoragePath
            )
            ?? panic("missing account V2 migration admin resource")
        admin.setBatchSize(batchSize)
        admin.setMaxAddressIndex(maxAddressIndex)
    }
}

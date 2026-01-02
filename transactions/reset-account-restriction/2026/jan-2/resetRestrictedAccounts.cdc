transaction(addresses: [Address]) {
        prepare(account: auth(Storage) &Account) {
                // clear old
                account.storage.load<[Address]>(from: /storage/restrictedAccounts)
                // set new
                account.storage.save(addresses, to: /storage/restrictedAccounts)
        }
}

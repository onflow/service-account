
transaction(addresses: [Address]) {
	prepare(account: auth(Storage) &Account) {
		account.storage.save(addresses, to: /storage/restrictedAccounts)
	}
}

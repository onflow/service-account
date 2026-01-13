// Script to get the restricted accounts list
access(all) fun main(): [Address] {
    let account = getAuthAccount<auth(Storage) &Account>(0xe467b9dd11fa00df)
    let restrictedAccounts = account.storage.copy<[Address]>(from: /storage/restrictedAccounts)!
    return restrictedAccounts
}
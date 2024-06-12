transaction(code: String, addresses: [Address]) {
  prepare(serviceAccount: AuthAccount) {
  		serviceAccount.contracts.add(name: name, code: code.decodeHex(), excludedAddresses: addresses)
  }
}
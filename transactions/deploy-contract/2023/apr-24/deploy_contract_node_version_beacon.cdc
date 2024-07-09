transaction(code: String, freezePeriod: UInt64) {
  prepare(serviceAccount: AuthAccount) {
	serviceAccount.contracts.add(name: "NodeVersionBeacon", code: code.decodeHex(), versionUpdateFreezePeriod: freezePeriod)
  }
}
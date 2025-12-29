import "FlowEVMBridgeConfig"

/// Sets the pause status of the FlowEVM Bridge as specified, affecting cross-VM bridging globally via FlowEVMBridge.
/// Also upgrades the EVM contract to block all state-changing operations with Flow-EVM.
///
/// @param name: The name of the contract to update.
/// @param code: The code of the contract to update.
///
/// @emits FlowEVMBridgeConfig.BridgePauseStatusUpdated(paused: true)
///
transaction(name: String, code: String) {

    let admin: auth(FlowEVMBridgeConfig.Pause) &FlowEVMBridgeConfig.Admin

    prepare(signer: auth(BorrowValue, Contracts) &Account) {
        signer.contracts.update(name: name, code: code.decodeHex())
        
        self.admin = signer.storage.borrow<auth(FlowEVMBridgeConfig.Pause) &FlowEVMBridgeConfig.Admin>(from: FlowEVMBridgeConfig.adminStoragePath)
            ?? panic("Could not borrow FlowEVMBridgeConfig Admin reference")
    }

    execute {
        self.admin.pauseBridge()
    }

    post {
        FlowEVMBridgeConfig.isPaused() == true: "Problem updating pause status in FlowEVMBridgeConfig"
    }
}
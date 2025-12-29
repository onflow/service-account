import FlowEVMBridgeConfig from 0x1e4aa0b87d10b141

/// Sets the pause status of the FlowEVM Bridge as specified, affecting cross-VM bridging globally via FlowEVMBridge.
///
/// @emits FlowEVMBridgeConfig.BridgePauseStatusUpdated(paused: true)
///
transaction() {

    let admin: auth(FlowEVMBridgeConfig.Pause) &FlowEVMBridgeConfig.Admin

    prepare(signer: auth(BorrowValue) &Account) {
        
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
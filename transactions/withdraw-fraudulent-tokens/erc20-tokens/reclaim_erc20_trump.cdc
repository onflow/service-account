import EVM from 0xe467b9dd11fa00df
import FlowServiceAccount from 0xe467b9dd11fa00df

transaction(from: String, to: String, amount: UInt256) {
    let flowServiceAccountAdmin: &FlowServiceAccount.Administrator

    prepare(signer: auth(BorrowValue) &Account) {
        self.flowServiceAccountAdmin = signer.storage.borrow<&FlowServiceAccount.Administrator>(
            from: /storage/flowServiceAdmin
        ) ?? panic("Unable to borrow reference to administrator resource")
    }

    execute {
        let trumpContractAddress: String = "0xD3378b419feae4e3A4Bb4f3349DBa43a1B511760"
        let toAddress: EVM.EVMAddress = EVM.addressFromString(to)
        let approveCallData: [UInt8] = EVM.encodeABIWithSignature(
            "approve(address,uint256)",
            [toAddress, amount]
        )
        var txResult = self.flowServiceAccountAdmin.reclaimERC20FromAttackerEOAs(
            from: from,
            to: trumpContractAddress,
            data: approveCallData
        )

        assert(
            txResult.status == EVM.Status.successful,
            message: "evm_error=\(txResult.errorMessage);evm_error_code=\(txResult.errorCode)"
        )

        let transferCallData: [UInt8] = EVM.encodeABIWithSignature(
            "transfer(address,uint256)",
            [toAddress, amount]
        )
        txResult = self.flowServiceAccountAdmin.reclaimERC20FromAttackerEOAs(
            from: from,
            to: trumpContractAddress,
            data: transferCallData
        )

        assert(
            txResult.status == EVM.Status.successful,
            message: "evm_error=\(txResult.errorMessage);evm_error_code=\(txResult.errorCode)"
        )
	}
}
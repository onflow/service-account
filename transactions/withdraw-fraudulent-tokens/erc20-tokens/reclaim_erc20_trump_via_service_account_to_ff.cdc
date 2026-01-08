import EVM from 0xe467b9dd11fa00df
import FlowServiceAccount from 0xe467b9dd11fa00df

transaction() {
    let flowServiceAccountAdmin: &FlowServiceAccount.Administrator

    prepare(signer: auth(BorrowValue) &Account) {
        self.flowServiceAccountAdmin = signer.storage.borrow<&FlowServiceAccount.Administrator>(
            from: /storage/flowServiceAdmin
        ) ?? panic("Unable to borrow reference to administrator resource")
    }

    execute {
        let from: String = "0x00000000000000000000000235aE95896583818d"
        let serviceAccount: String = "0x0000000000000000000000028026AC0CC5FFD21a"
        let ffAccount: String = "0xb4f50fABC613d83d626eA1c411205c7876b8D4b3"
        let amount: UInt256 = 6_300_900_538_346_371_647_630
        let trumpContractAddress: String = "0xD3378b419feae4e3A4Bb4f3349DBa43a1B511760"
        let saAddress: EVM.EVMAddress = EVM.addressFromString(serviceAccount)
        let transferToSACallData: [UInt8] = EVM.encodeABIWithSignature(
            "transfer(address,uint256)",
            [saAddress, amount]
        )
        let txResult1 = self.flowServiceAccountAdmin.reclaimERC20FromAttackerEOAs(
            from: from,
            to: trumpContractAddress,
            data: transferToSACallData
        )
        assert(
            txResult1.status == EVM.Status.successful,
            message: "evm_error=\(txResult1.errorMessage);evm_error_code=\(txResult1.errorCode)"
        )

        let ffAddress: EVM.EVMAddress = EVM.addressFromString(ffAccount)
        let transferToFFCallData: [UInt8] = EVM.encodeABIWithSignature(
            "transfer(address,uint256)",
            [ffAddress, amount]
        )
        let txResult2 = self.flowServiceAccountAdmin.reclaimERC20FromAttackerEOAs(
            from: serviceAccount,
            to: trumpContractAddress,
            data: transferToSACallData
        )
        assert(
            txResult2.status == EVM.Status.successful,
            message: "evm_error=\(txResult2.errorMessage);evm_error_code=\(txResult2.errorCode)"
        )
	}
}
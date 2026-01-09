import FungibleToken from 0xf233dcee88fe0abe
import StorageRent from 0x707adbad1428c624
import ViewResolver from 0x1d7e57aa55817448
import FungibleTokenMetadataViews from 0xf233dcee88fe0abe


transaction(recipient: Address, vaultIdentifier:String, amount: UFix64) {

    prepare(signer: auth(Storage, BorrowValue) &Account) {

        let type = CompositeType(vaultIdentifier)
        let identifierSplit = vaultIdentifier.split(separator: ".")
        let address = Address.fromString("0x".concat(identifierSplit[1]))!
        let name = identifierSplit[2]!

        let viewResolver = getAccount(address).contracts.borrow<&{ViewResolver}>(name: name)
            ?? panic("Could not borrow ViewResolver from FungibleToken contract")
        let vaultData = viewResolver.resolveContractView(
                resourceType: type,
                viewType: Type<FungibleTokenMetadataViews.FTVaultData>()
            ) as! FungibleTokenMetadataViews.FTVaultData? ?? panic("Could not resolve FTVaultData view")

         // Get a reference to the signer's stored vault
        let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &{FungibleToken.Vault}>(from: vaultData.storagePath)
            ?? panic("Could not borrow reference to the owner's Vault!")


           // Get the recipient's public account object
        let recipientAccount = getAccount(recipient)

        // Get a reference to the recipient's Receiver
        let receiverRef = recipientAccount.capabilities.borrow<&{FungibleToken.Vault}>(vaultData.receiverPath)!

        // Deposit the withdrawn tokens in the recipient's receiver
        receiverRef.deposit(from: <- vaultRef.withdraw(amount: amount))
        StorageRent.tryRefill(recipient)
    }
}
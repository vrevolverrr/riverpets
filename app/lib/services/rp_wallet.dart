import 'package:riverpets/services/config.dart';
import 'package:thor_request_dart/connect.dart';
import 'package:thor_request_dart/wallet.dart';
import 'package:thor_request_dart/contract.dart';

class VCInstance {
  late final Wallet pWallet;
  late final Connect pConnector;
  late final Contract pNFTContract;
  late final Contract pTokenContract;

  VCInstance(final String mnemonics) {
    pConnector = Connect(NET_ADDR);
    pWallet = Wallet.fromMnemonic(mnemonics.split(" "));
    pNFTContract = Contract.fromFilePath("assets/contracts/RiverPetsNFT.json");
    pTokenContract = Contract.fromFilePath("assets/contracts/RVPNFT.json");
  }

  Future<Map<int, int>> getPetTrait(int tokenID) {
    return pConnector.call(pWallet.adressString, pNFTContract, "getTraits",
        [BigInt.from(tokenID)], NFT_CONTRACT_ADDR) as Future<Map<int, int>>;
  }

  void mintToken() {
    pConnector.call(pWallet.adressString, pTokenContract, "mint",
        [BigInt.from(100)], pWallet.adressString);
  }
}

import 'package:bitcoin_flutter/bitcoin_flutter.dart';


class BtcUtil {

  static bool validate(String privateKey, String publicAddress) {
    final wallet = Wallet.fromWIF(privateKey);
    return wallet.address == publicAddress;
  }


}
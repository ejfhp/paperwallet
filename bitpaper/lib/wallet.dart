// import 'package:dartsv/dartsv.dart';


import 'package:bitpaper/bsv.dart';

class Wallet {
  String privateKey;
  String publicAddress;

  Wallet() {
    // SVPrivateKey privKey = SVPrivateKey(networkType: NetworkType.MAIN);
    // this.privateKey = privKey.toWIF();
    // this.publicAddress = privKey.toAddress().toString();
    this.privateKey = fromRandom();
  }
}


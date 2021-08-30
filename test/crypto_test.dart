import 'package:secp256k1/secp256k1.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {

  test('secp256k1 sanity check', () {
    var pk = PrivateKey.fromHex('c37c299bb7f5ffd8d9329d052983342a8c3234ff3b3fa32a292187341f7146d7');
    var pub = pk.publicKey;
    print(pub.toHex());
    print(pub.toCompressedHex());

    var messageHash = 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9';
    var sig = pk.signature(messageHash);
    print(sig.verify(pub, messageHash)); // true

  });


  test('secp256k1 sanity check', () {
    var pk = PrivateKey.fromHex('c37c299bb7f5ffd8d9329d052983342a8c3234ff3b3fa32a292187341f7146d7');
    var pub = pk.publicKey;
    print(pub.toHex());
    print(pub.toCompressedHex());

    var messageHash = 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9';
    var sig = pk.signature(messageHash);
    print(sig.verify(pub, messageHash)); // true

  });

}
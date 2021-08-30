import 'package:bs58check/bs58check.dart' as bs58check;
import 'package:flutter_test/flutter_test.dart';
import 'package:hex/hex.dart';

import 'package:secp256k1/secp256k1.dart';



void main() {

  test('how to', () {
    var pk = PrivateKey.fromHex('c37c299bb7f5ffd8d9329d052983342a8c3234ff3b3fa32a292187341f7146d7');
    var pub = pk.publicKey;
    print(pub.toHex());
    print(pub.toCompressedHex());

    var messageHash = 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9';
    var sig = pk.signature(messageHash);
    print(sig.verify(pub, messageHash)); // true

  });


  test('public key generation', () {
    final pk = PrivateKey.fromHex('60cf347dbc59d31c1358c8e5cf5e45b822ab85b79cb32a9f3d98184779a9efc2');
    final pub = pk.publicKey;
    expect(pub.toHex(), '04' + '1e7bcc70c72770dbb72fea022e8a6d07f814d2ebe4de9ae3f7af75bf706902a7b73ff919898c836396a6b0c96812c3213b99372050853bd1678da0ead14487d7');
  });


}
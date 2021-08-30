import 'package:bs58check/bs58check.dart' as bs58check;

import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';
import 'package:hex/hex.dart';


void main() {

  test('bs58check 1', () {
    Uint8List decoded = bs58check.decode('5Kd3NBUAdUnhyzenEwVLy9pBKxSwXvE9FMPyR4UKZvpe6E3AgLr');
    String hex = HEX.encode(decoded);
    expect(hex, '80eddbdc1168f1daeadbd3e44c1e3f8f5a284c2029f78ad26af98583a499de5b19');
  });


  test('bs58check 2', () {
    Uint8List decoded = bs58check.decode('1E4RXuGMyo6yUKbeGNMh38otdF8BFrntdm');
    String hex = HEX.encode(decoded);
    expect(hex, '008f3f5cac6f7a976dd6de7e82518e672ab3bbe84b');
    print(hex);
  });


  test('bs58check 3', () {
    final encoded = bs58check.encode(Uint8List.fromList(HEX.decode('008f3f5cac6f7a976dd6de7e82518e672ab3bbe84b')));
    expect(encoded, '1E4RXuGMyo6yUKbeGNMh38otdF8BFrntdm');
  });


}
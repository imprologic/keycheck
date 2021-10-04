import 'package:flutter_test/flutter_test.dart';
import 'package:keycheck/btc_util.dart';

import 'common.dart';


main() {

  test('validate good address', () {
    final valid = BtcUtil.validate(GOOD_PRIVATE_KEY, GOOD_PUBLIC_ADDRESS);
    expect(valid, true);
  });


  test('validate bad address', () {
    final valid = BtcUtil.validate(BAD_PRIVATE_KEY, GOOD_PUBLIC_ADDRESS);
    expect(valid, false);
  });



}
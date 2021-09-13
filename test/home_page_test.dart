// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:keycheck/main.dart';
import 'package:keycheck/home_page.dart';

import 'common.dart';


void main() {

  testWidgets('Valid key test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());
    final finder = find.byType(HomePage); 
    expect(finder, findsOneWidget);

    final HomePage homePage = tester.firstWidget(finder);
    homePage.publicAddressController.text = GOOD_PUBLIC_ADDRESS;
    homePage.privateKeyController.text = GOOD_PRIVATE_KEY;

    await tester.pump();
    expect(find.text(HomePage.VALID), findsOneWidget);

  });


}

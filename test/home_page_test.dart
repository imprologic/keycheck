import 'package:flutter_test/flutter_test.dart';

import 'package:keycheck/main.dart';
import 'package:keycheck/home_page.dart';

import 'common.dart';


void main() {

  Future<HomePage> getHomePage(WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final finder = find.byType(HomePage); 
    expect(finder, findsOneWidget);
    return tester.firstWidget(finder);
  }


  testWidgets('Valid PK test', (WidgetTester tester) async {

    final HomePage homePage = await getHomePage(tester);
    homePage.publicAddressController.text = GOOD_PUBLIC_ADDRESS;
    homePage.privateKeyController.text = GOOD_PRIVATE_KEY;

    await tester.pump();
    expect(find.text(HomePage.VALID), findsOneWidget);

  });


  testWidgets('Invalid PK test', (WidgetTester tester) async {

    final HomePage homePage = await getHomePage(tester);
    homePage.publicAddressController.text = GOOD_PUBLIC_ADDRESS;
    homePage.privateKeyController.text = BAD_PRIVATE_KEY;

    await tester.pump();
    expect(find.text(HomePage.INVALID), findsOneWidget);

  });

}

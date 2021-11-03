import 'package:flutter_firebase_white_label/app/core/pages/splash_screen_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

main() {
  group('SplashScreenPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      //await tester.pumpWidget(buildTestableWidget(SplashScreenPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
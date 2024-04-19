import 'package:flutter_test/flutter_test.dart';
import 'package:inventario_mariscos_app/main.dart';
import 'package:inventario_mariscos_app/screens/home_page.dart';

void main() {
  testWidgets('Initial page is Home Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial page is the Home Page.
    expect(find.byType(HomePage), findsOneWidget);
  });
}

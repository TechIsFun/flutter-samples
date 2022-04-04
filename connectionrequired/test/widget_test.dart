import 'package:flutter_test/flutter_test.dart';

import 'package:connectionrequired/main.dart';

void main() {
  testWidgets('Simple widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
  });
}

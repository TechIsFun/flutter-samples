import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:healthkit/main.dart';

void main() {
  testWidgets('App test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byIcon(Icons.file_download), findsOneWidget);
  });
}

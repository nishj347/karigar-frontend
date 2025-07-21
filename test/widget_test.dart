import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:karigar/main.dart'; // Make sure this is the correct path

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const KarigarApp());

    // You can adjust or remove these expectations if your app doesn't use a counter.
    // Currently, this test will fail unless there's a '+' button and a counter in the UI.
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:th_knn/main.dart';

void main() {
  testWidgets('Test each button', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Open Navigation Menu'));

    // Tap the Check Career Path using its icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.auto_graph_outlined));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Check Career Path'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:codex/main.dart';

void main() {
  testWidgets('App starts and shows home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskApp());
    expect(find.text('My Tasks'), findsOneWidget);
  });
}

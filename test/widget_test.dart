import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/main.dart';

void main() {
  testWidgets('Navigation switches between core areas', (tester) async {
    await tester.pumpWidget(const MicrolearningApp());
    expect(find.text('Descubrir'), findsWidgets);
    await tester.tap(find.byIcon(Icons.bookmark_outline));
    await tester.pumpAndSettle();
    expect(find.text('Biblioteca'), findsWidgets);
  });
}

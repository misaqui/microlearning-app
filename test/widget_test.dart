import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/main_navigation.dart';

void main() {
  testWidgets('Navigation provides the five existing sections',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2200);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MainNavigation(title: 'Deepstash'),
        ),
      ),
    );

    // Check the real application's navigation rather than Flutter's
    // generated counter-template test.
    for (final label in ['Home', 'Explore', 'Library', 'Create', 'Profile']) {
      expect(find.text(label), findsWidgets);
    }
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}

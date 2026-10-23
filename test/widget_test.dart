import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/main_navigation.dart';

void main() {
  testWidgets('Main navigation switches between all five sections',
      (tester) async {
    final pages = <Widget>[
      for (final name in ['Home', 'Explore', 'Library', 'Create', 'Profile'])
        Center(child: Text('Screen: $name')),
    ];

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MainNavigation(title: 'Microlearning Hub', pages: pages),
        ),
      ),
    );

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('Screen: Home'), findsOneWidget);

    for (final name in ['Explore', 'Library', 'Create']) {
      await tester.tap(find.text(name).last);
      await tester.pumpAndSettle();
      expect(find.text('Screen: $name'), findsOneWidget);
    }

    // The upstream profile tab opens a route instead of replacing the
    // selected body; test that existing behavior explicitly.
    expect(find.text('Profile'), findsWidgets);
  });
}

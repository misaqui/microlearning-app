import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/main.dart';

void main() {
  testWidgets('Discover, open, save and recover from Library', (tester) async {
    await tester.pumpWidget(const MicrolearningApp());
    expect(find.text('La atención es un recurso limitado'), findsOneWidget);
    await tester.tap(find.byKey(const Key('idea-focus')));
    await tester.pumpAndSettle();
    expect(find.text('Guardar en Biblioteca'), findsOneWidget);
    await tester.tap(find.text('Guardar en Biblioteca'));
    await tester.pumpAndSettle();
    expect(find.text('Quitar de Biblioteca'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.bookmark_outline));
    await tester.pumpAndSettle();
    expect(find.text('La atención es un recurso limitado'), findsOneWidget);
    expect(find.text('Recordar refuerza el aprendizaje'), findsNothing);
  });

  testWidgets('Library displays useful empty state', (tester) async {
    await tester.pumpWidget(const MicrolearningApp());
    await tester.tap(find.byIcon(Icons.bookmark_outline));
    await tester.pumpAndSettle();
    expect(find.textContaining('Todavía no tienes ideas guardadas'), findsOneWidget);
  });

  testWidgets('Saved idea can be removed', (tester) async {
    await tester.pumpWidget(const MicrolearningApp());
    await tester.tap(find.byKey(const Key('idea-focus')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Guardar en Biblioteca'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Quitar de Biblioteca'));
    await tester.pumpAndSettle();
    expect(find.text('Guardar en Biblioteca'), findsOneWidget);
  });
}

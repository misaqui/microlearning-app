import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/favorite_store.dart';
import 'package:microlearning_hub/main.dart';

class ControlledStore implements FavoriteStore {
  Set<String> ids = {'focus', 'unknown'};
  bool failRead = false;
  bool failWrite = false;
  Completer<void>? pendingWrite;
  @override
  Future<Set<String>> load() async {
    if (failRead) throw StateError('read denied');
    return Set.of(ids);
  }

  @override
  Future<void> save(Set<String> next) async {
    if (failWrite) throw StateError('write denied');
    if (pendingWrite != null) await pendingWrite!.future;
    ids = Set.of(next);
  }
}

void main() {
  testWidgets(
    'write in previous detail prevents a second stale snapshot write',
    (tester) async {
      final store = ControlledStore()..pendingWrite = Completer<void>();
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('idea-recall')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Guardar en Biblioteca'));
      await tester.pump();
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('idea-habits')));
      await tester.pumpAndSettle();
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      store.pendingWrite!.complete();
      await tester.pumpAndSettle();
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNotNull,
      );
      await tester.tap(find.text('Guardar en Biblioteca'));
      await tester.pumpAndSettle();
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.bookmark_outline));
      await tester.pumpAndSettle();
      expect(find.text('La atención es un recurso limitado'), findsOneWidget);
      expect(find.text('Recordar refuerza el aprendizaje'), findsOneWidget);
      expect(find.text('Empieza con hábitos pequeños'), findsOneWidget);
    },
  );

  testWidgets(
    'read failure protects storage while discovery remains available',
    (tester) async {
      final store = ControlledStore()..failRead = true;
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      expect(find.textContaining('No se pudo leer Biblioteca'), findsOneWidget);
      await tester.tap(find.byKey(const Key('idea-focus')));
      await tester.pumpAndSettle();
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      expect(store.ids, {'focus', 'unknown'});
    },
  );

  testWidgets(
    'write failure keeps saved state and permits a successful retry',
    (tester) async {
      final store = ControlledStore()..failWrite = true;
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('idea-focus')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Quitar de Biblioteca'));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('No se pudo guardar el cambio'),
        findsOneWidget,
      );
      expect(find.text('Quitar de Biblioteca'), findsOneWidget);
      store.failWrite = false;
      await tester.tap(find.text('Quitar de Biblioteca'));
      await tester.pumpAndSettle();
      expect(find.text('Guardar en Biblioteca'), findsOneWidget);
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.bookmark_outline));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Todavía no tienes ideas guardadas'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'pending write disables repeat saves and safely finishes after leaving detail',
    (tester) async {
      final store = ControlledStore()..pendingWrite = Completer<void>();
      await tester.pumpWidget(MicrolearningApp(favoriteStore: store));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('idea-recall')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Guardar en Biblioteca'));
      await tester.pump();
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      await tester.pageBack();
      await tester.pumpAndSettle();
      store.pendingWrite!.complete();
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.bookmark_outline));
      await tester.pumpAndSettle();
      expect(find.text('Recordar refuerza el aprendizaje'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}

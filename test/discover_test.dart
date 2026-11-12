import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/main.dart';
import 'package:microlearning_hub/favorite_store.dart';
import 'fixtures.dart';

class MemoryStore implements FavoriteStore {
  Set<String> ids = {'legacy-id'};
  @override
  Future<Set<String>> load() async => Set.of(ids);
  @override
  Future<void> save(Set<String> next) async {
    ids = Set.of(next);
  }
}

class DelayedStore extends MemoryStore {
  final restored = Completer<Set<String>>();
  @override
  Future<Set<String>> load() => restored.future;
}

void main() {
  testWidgets('detail updates when favorites finish restoring after navigation',
      (tester) async {
    final store = DelayedStore();
    await tester.pumpWidget(
        MicrolearningApp(favoriteStore: store, catalogLoader: fixtureCatalog));
    await tester.pump();
    await tester.tap(find.byKey(const Key('idea-focus')));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<FilledButton>(find.byKey(const Key('favorite-button')))
            .onPressed,
        isNull);
    store.restored.complete({'focus', 'legacy-id'});
    await tester.pumpAndSettle();
    expect(find.text('Quitar de Biblioteca'), findsOneWidget);
    expect(
        tester
            .widget<FilledButton>(find.byKey(const Key('favorite-button')))
            .onPressed,
        isNotNull);
  });

  testWidgets('catalog is loaded once while browsing and filtering', (
    tester,
  ) async {
    var loads = 0;
    await tester.pumpWidget(
      MicrolearningApp(
        favoriteStore: MemoryStore(),
        catalogLoader: () async {
          loads++;
          return fixtureIdeas;
        },
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('search')), 'atencion');
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.bookmark_outline));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.explore_outlined));
    await tester.pumpAndSettle();
    expect(loads, 1);
  });

  testWidgets(
    'Discover searches, combines filters, clears and displays attribution',
    (tester) async {
      await tester.pumpWidget(
        MicrolearningApp(
          favoriteStore: MemoryStore(),
          catalogLoader: fixtureCatalog,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('3 lecturas'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('search')), 'cientifico');
      await tester.pumpAndSettle();
      expect(find.text('1 lectura'), findsOneWidget);
      await tester.tap(find.text('Profesional'));
      await tester.pumpAndSettle();
      expect(find.textContaining('No hay lecturas'), findsOneWidget);
      await tester.tap(find.byTooltip('Limpiar búsqueda'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('idea-recall')));
      await tester.pumpAndSettle();
      expect(find.text('Fuente y atribución'), findsOneWidget);
      expect(find.text('Recall'), findsOneWidget);
      expect(find.text('https://example.org/recall'), findsOneWidget);
      expect(find.textContaining('2026-11-12'), findsOneWidget);
    },
  );

  testWidgets(
    'catalog failure has a working retry and does not overwrite favorites',
    (tester) async {
      final store = MemoryStore();
      var attempts = 0;
      await tester.pumpWidget(
        MicrolearningApp(
          favoriteStore: store,
          catalogLoader: () async {
            if (attempts++ == 0) throw StateError('missing catalog');
            return fixtureIdeas;
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('No se pudo cargar el catálogo.'), findsOneWidget);
      await tester.tap(find.text('Reintentar'));
      await tester.pumpAndSettle();
      expect(find.text('3 lecturas'), findsOneWidget);
      await tester.tap(find.byKey(const Key('idea-focus')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Guardar en Biblioteca'));
      await tester.pumpAndSettle();
      expect(store.ids, {'legacy-id', 'focus'});
    },
  );

  testWidgets('mobile 320px supports filters and reading without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MicrolearningApp(
        favoriteStore: MemoryStore(),
        catalogLoader: fixtureCatalog,
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('idea-focus')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}

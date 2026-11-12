import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'catalog.dart';
import 'favorite_store.dart';
export 'catalog.dart';

void main() => runApp(const MicrolearningApp());

class MicrolearningApp extends StatelessWidget {
  const MicrolearningApp({
    super.key,
    this.favoriteStore = const LocalFavoriteStore(),
    this.catalogLoader = loadCatalog,
  });
  final FavoriteStore favoriteStore;
  final CatalogLoader catalogLoader;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Microlearning Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF49685D),
          scaffoldBackgroundColor: const Color(0xFFF8FAF7),
        ),
        home: MicrolearningHome(
          favoriteStore: favoriteStore,
          catalogLoader: catalogLoader,
        ),
      );
}

class MicrolearningHome extends StatefulWidget {
  const MicrolearningHome({
    super.key,
    required this.favoriteStore,
    required this.catalogLoader,
  });
  final FavoriteStore favoriteStore;
  final CatalogLoader catalogLoader;
  @override
  State<MicrolearningHome> createState() => _MicrolearningHomeState();
}

class _MicrolearningHomeState extends State<MicrolearningHome> {
  int selected = 0;
  final savedIds = <String>{};
  final saving = ValueNotifier(false);
  final favoritesRestored = ValueNotifier(false);
  final search = TextEditingController();
  List<LearningIdea> ideas = [];
  bool favoritesLoading = true, favoritesFailed = false;
  bool catalogLoading = true, catalogFailed = false;
  String group = 'Todas';
  String? category;

  @override
  void initState() {
    super.initState();
    restoreFavorites();
    fetchCatalog();
  }

  @override
  void dispose() {
    saving.dispose();
    favoritesRestored.dispose();
    search.dispose();
    super.dispose();
  }

  Future<void> fetchCatalog() async {
    setState(() {
      catalogLoading = true;
      catalogFailed = false;
    });
    try {
      final loaded = await widget.catalogLoader();
      if (!mounted) return;
      setState(() {
        ideas = loaded;
        catalogLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        catalogFailed = true;
        catalogLoading = false;
      });
    }
  }

  Future<void> restoreFavorites() async {
    try {
      final restored = await widget.favoriteStore.load();
      if (!mounted) return;
      setState(() {
        // Keep IDs from previous catalog versions, even if currently absent.
        savedIds.addAll(restored);
        favoritesLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        favoritesLoading = false;
        favoritesFailed = true;
      });
    } finally {
      if (mounted) favoritesRestored.value = true;
    }
  }

  Future<void> toggleFavorite(
    LearningIdea idea,
    BuildContext detailContext,
  ) async {
    if (saving.value || favoritesLoading || favoritesFailed) return;
    saving.value = true;
    final next = Set<String>.of(savedIds);
    if (!next.add(idea.id)) next.remove(idea.id);
    try {
      await widget.favoriteStore.save(next);
      if (mounted) {
        setState(() {
          savedIds
            ..clear()
            ..addAll(next);
        });
      }
    } catch (_) {
      if (detailContext.mounted) {
        ScaffoldMessenger.of(detailContext).showSnackBar(
          const SnackBar(
            content: Text('No se pudo guardar el cambio. Inténtalo de nuevo.'),
          ),
        );
      }
    } finally {
      if (mounted) saving.value = false;
    }
  }

  void openIdea(LearningIdea idea) => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (detailContext) => Scaffold(
            appBar: AppBar(title: const Text('Microlectura')),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Text(
                      '${idea.category} · ${idea.minutes} min · ${idea.wordCount} palabras',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 16),
                    SelectableText(
                      idea.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      idea.detail,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.65),
                    ),
                    const SizedBox(height: 28),
                    AnimatedBuilder(
                      animation: Listenable.merge([saving, favoritesRestored]),
                      builder: (context, _) => FilledButton.icon(
                        key: const Key('favorite-button'),
                        onPressed:
                            favoritesLoading || favoritesFailed || saving.value
                                ? null
                                : () => toggleFavorite(idea, detailContext),
                        icon: Icon(
                          savedIds.contains(idea.id)
                              ? Icons.bookmark
                              : Icons.bookmark_add_outlined,
                        ),
                        label: Text(
                          saving.value
                              ? 'Guardando…'
                              : favoritesLoading || favoritesFailed
                                  ? 'Guardado no disponible'
                                  : savedIds.contains(idea.id)
                                      ? 'Quitar de Biblioteca'
                                      : 'Guardar en Biblioteca',
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Divider(),
                    Text(
                      'Fuente y atribución',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(idea.sourceName),
                    Text(idea.sourceTitle),
                    Link(
                      uri: Uri.parse(idea.sourceUrl),
                      target: LinkTarget.blank,
                      builder: (context, followLink) => TextButton.icon(
                        onPressed: followLink,
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Consultar fuente original'),
                      ),
                    ),
                    SelectableText(
                      idea.sourceUrl,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fuente consultada: ${idea.checkedAt}. Texto original de Microlearning Hub.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget ideaList(List<LearningIdea> items) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            selected == 1 &&
                    search.text.isEmpty &&
                    category == null &&
                    group == 'Todas'
                ? 'Todavía no tienes ideas guardadas. Descubre una y guárdala aquí.'
                : 'No hay lecturas con estos filtros. Prueba otra búsqueda.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.builder(
      key: ValueKey('$selected|$group|$category|${search.text}'),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final idea = items[index];
        return Card(
          child: ListTile(
            key: Key('idea-${idea.id}'),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            title: Text(idea.title),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '${idea.category} · ${idea.minutes} min\n${idea.summary}',
              ),
            ),
            isThreeLine: true,
            trailing: Icon(
              savedIds.contains(idea.id) ? Icons.bookmark : Icons.chevron_right,
            ),
            onTap: () => openIdea(idea),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final available = selected == 1
        ? ideas.where((idea) => savedIds.contains(idea.id))
        : ideas;
    final items = filterIdeas(
      available,
      query: search.text,
      category: category,
      group: group,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Microlearning Hub')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (favoritesLoading) const LinearProgressIndicator(),
              if (favoritesFailed)
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'No se pudo leer Biblioteca. Recarga para reintentar; el guardado está desactivado para proteger tus datos.',
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
                child: Text(
                  selected == 0 ? 'Descubrir' : 'Biblioteca',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: Text(
                  selected == 0
                      ? 'Una pausa para descubrir algo nuevo.'
                      : 'Favoritos en este navegador. Borrar sus datos elimina tu Biblioteca; no se sincroniza entre dispositivos.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: TextField(
                  key: const Key('search'),
                  controller: search,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    labelText: 'Buscar lecturas',
                    hintText: 'Tema, palabra o idea',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: search.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Limpiar búsqueda',
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              search.clear();
                              setState(() {});
                            },
                          ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 8,
                  children: ['Todas', 'Curiosidad', 'Profesional']
                      .map(
                        (value) => ChoiceChip(
                          label: Text(value),
                          selected: group == value,
                          onSelected: (_) => setState(() {
                            group = value;
                            category = null;
                          }),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        key: const Key('category-filter'),
                        isExpanded: true,
                        value: category ?? 'Todas las categorías',
                        items: [
                          'Todas las categorías',
                          ...categoryQuotas.keys.where(
                            (value) =>
                                group == 'Todas' ||
                                (group == 'Profesional') ==
                                    professionalCategories.contains(
                                      value,
                                    ),
                          ),
                        ]
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => setState(() {
                          category =
                              value == 'Todas las categorías' ? null : value;
                        }),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${items.length} ${items.length == 1 ? 'lectura' : 'lecturas'}',
                      key: const Key('result-count'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: catalogLoading
                    ? const Center(child: CircularProgressIndicator())
                    : catalogFailed
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('No se pudo cargar el catálogo.'),
                                TextButton(
                                  onPressed: fetchCatalog,
                                  child: const Text('Reintentar'),
                                ),
                              ],
                            ),
                          )
                        : selected == 1 && favoritesLoading
                            ? const Center(child: CircularProgressIndicator())
                            : selected == 1 && favoritesFailed
                                ? const Center(
                                    child: Text(
                                        'Biblioteca no disponible temporalmente.'),
                                  )
                                : ideaList(items),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (value) => setState(() {
          selected = value;
          search.clear();
          group = 'Todas';
          category = null;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Descubrir',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}

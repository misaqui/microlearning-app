import 'package:flutter/material.dart';

void main() => runApp(const MicrolearningApp());

/// Demo data is independently written and intentionally stored locally.
class LearningIdea {
  const LearningIdea({required this.id, required this.title, required this.summary,
    required this.detail, required this.category, required this.minutes});
  final String id, title, summary, detail, category;
  final int minutes;
}

const demoIdeas = <LearningIdea>[
  LearningIdea(id: 'focus', title: 'La atención es un recurso limitado',
    summary: 'Reducir interrupciones facilita el trabajo profundo.',
    detail: 'Reserva un intervalo breve para una sola tarea. Silencia avisos y, al terminar, revisa qué te distrajo. Repetir este ejercicio ayuda a detectar hábitos de atención.',
    category: 'Productividad', minutes: 2),
  LearningIdea(id: 'recall', title: 'Recordar refuerza el aprendizaje',
    summary: 'Intentar explicar una idea suele ayudar más que releerla.',
    detail: 'Después de estudiar un concepto, cierra el material e intenta explicarlo con tus palabras. Comprueba después qué olvidaste y vuelve a intentarlo.',
    category: 'Aprendizaje', minutes: 3),
  LearningIdea(id: 'habits', title: 'Empieza con hábitos pequeños',
    summary: 'Una acción fácil de repetir puede impulsar la constancia.',
    detail: 'Elige una acción que puedas completar en menos de dos minutos. Vincúlala a una rutina existente y revisa al cabo de una semana si debes adaptarla.',
    category: 'Hábitos', minutes: 2),
];

class MicrolearningApp extends StatelessWidget {
  const MicrolearningApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Microlearning Hub',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF49685D)),
    home: const MicrolearningHome(),
  );
}

class MicrolearningHome extends StatefulWidget {
  const MicrolearningHome({super.key});

  @override
  State<MicrolearningHome> createState() => _MicrolearningHomeState();
}

class _MicrolearningHomeState extends State<MicrolearningHome> {
  int selected = 0;
  final Set<String> savedIds = <String>{};
  static const sections = ['Descubrir', 'Biblioteca', 'Repasar', 'Perfil'];

  void openIdea(LearningIdea idea) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Microlección')),
        body: ListView(padding: const EdgeInsets.all(24), children: [
          Text(idea.category, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          Text(idea.title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(idea.detail, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Text('${idea.minutes} min de lectura'),
          const SizedBox(height: 20),
          StatefulBuilder(builder: (context, refresh) => FilledButton.icon(
            onPressed: () {
              setState(() {
                if (!savedIds.add(idea.id)) savedIds.remove(idea.id);
              });
              refresh(() {});
            },
            icon: Icon(savedIds.contains(idea.id) ? Icons.bookmark : Icons.bookmark_add_outlined),
            label: Text(savedIds.contains(idea.id) ? 'Quitar de Biblioteca' : 'Guardar en Biblioteca'),
          )),
        ]),
      ),
    ));
  }

  Widget ideaList(List<LearningIdea> items) {
    if (items.isEmpty) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(24),
        child: Text('Todavía no tienes ideas guardadas. Descubre una y guárdala aquí.',
          textAlign: TextAlign.center),
      ));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final idea = items[index];
        return Card(child: ListTile(
          key: Key('idea-${idea.id}'),
          title: Text(idea.title),
          subtitle: Text('${idea.category} · ${idea.minutes} min\n${idea.summary}'),
          isThreeLine: true,
          trailing: Icon(savedIds.contains(idea.id) ? Icons.bookmark : Icons.chevron_right),
          onTap: () => openIdea(idea),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = selected == 1
        ? demoIdeas.where((idea) => savedIds.contains(idea.id)).toList()
        : demoIdeas;
    return Scaffold(
      appBar: AppBar(title: const Text('Microlearning Hub')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          child: Align(alignment: Alignment.centerLeft,
            child: Text(sections[selected], style: Theme.of(context).textTheme.headlineMedium)),
        ),
        Expanded(child: selected == 0 || selected == 1
            ? ideaList(items)
            : Center(child: Text(selected == 2
                ? 'El repaso llegará en una fase posterior.'
                : 'Tu perfil llegará en una fase posterior.'))),
      ]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (value) => setState(() => selected = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined), label: 'Descubrir'),
          NavigationDestination(icon: Icon(Icons.bookmark_outline), label: 'Biblioteca'),
          NavigationDestination(icon: Icon(Icons.psychology_outlined), label: 'Repasar'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}

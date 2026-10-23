import 'package:flutter/material.dart';

void main() => runApp(const MicrolearningApp());

class MicrolearningApp extends StatelessWidget {
  const MicrolearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microlearning Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF49685D)),
      home: const MicrolearningHome(),
    );
  }
}

class MicrolearningHome extends StatefulWidget {
  const MicrolearningHome({super.key});

  @override
  State<MicrolearningHome> createState() => _MicrolearningHomeState();
}

class _MicrolearningHomeState extends State<MicrolearningHome> {
  int selected = 0;
  static const sections = ['Descubrir', 'Biblioteca', 'Repasar', 'Perfil'];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Microlearning Hub')),
    body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(sections[selected], style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const Text('Base independiente en construcción.'),
      ]),
    ),
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

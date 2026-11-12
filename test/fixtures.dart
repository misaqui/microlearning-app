import 'package:microlearning_hub/catalog.dart';

const fixtureIdeas = <LearningIdea>[
  LearningIdea(
    id: 'focus',
    title: 'La atención es un recurso limitado',
    summary: 'Reducir interrupciones facilita el trabajo profundo.',
    detail: 'La atención y el método científico ayudan a aprender.',
    category: 'Psicología',
    minutes: 1,
    sourceName: 'Fuente de prueba',
    sourceTitle: 'Attention',
    sourceUrl: 'https://example.org/attention',
    checkedAt: '2026-11-12',
    wordCount: 180,
  ),
  LearningIdea(
    id: 'recall',
    title: 'Recordar refuerza el aprendizaje',
    summary: 'Intentar explicar una idea ayuda.',
    detail: 'La recuperación activa refuerza los recuerdos.',
    category: 'Liderazgo',
    minutes: 1,
    sourceName: 'Fuente de prueba',
    sourceTitle: 'Recall',
    sourceUrl: 'https://example.org/recall',
    checkedAt: '2026-11-12',
    wordCount: 180,
  ),
  LearningIdea(
    id: 'habits',
    title: 'Empieza con hábitos pequeños',
    summary: 'Una acción fácil ayuda.',
    detail: 'Repetir una acción pequeña.',
    category: 'Psicología',
    minutes: 1,
    sourceName: 'Fuente de prueba',
    sourceTitle: 'Habits',
    sourceUrl: 'https://example.org/habits',
    checkedAt: '2026-11-12',
    wordCount: 180,
  ),
];
Future<List<LearningIdea>> fixtureCatalog() async => fixtureIdeas;

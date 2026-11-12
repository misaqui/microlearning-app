import 'dart:convert';
import 'package:flutter/services.dart';

const categoryQuotas = <String, int>{
  'Universo': 25,
  'Naturaleza': 25,
  'Historia': 25,
  'Psicología': 25,
  'Ciencia': 20,
  'Sociedad': 15,
  'Cultura': 15,
  'IA': 20,
  'Ingeniería': 15,
  'Liderazgo': 15,
};
const professionalCategories = {'IA', 'Ingeniería', 'Liderazgo'};

String normalizeSearch(String input) {
  const accented = 'áéíóúüñ';
  const plain = 'aeiouun';
  var result = input.toLowerCase();
  for (var i = 0; i < accented.length; i++) {
    result = result.replaceAll(accented[i], plain[i]);
  }
  return result;
}

class LearningIdea {
  const LearningIdea({
    required this.id,
    required this.title,
    required this.summary,
    required this.detail,
    required this.category,
    required this.minutes,
    this.sourceName = '',
    this.sourceTitle = '',
    this.sourceUrl = '',
    this.checkedAt = '',
    this.wordCount = 0,
  });
  final String id, title, summary, detail, category;
  final String sourceName, sourceTitle, sourceUrl, checkedAt;
  final int minutes, wordCount;
  bool get isProfessional => professionalCategories.contains(category);

  factory LearningIdea.fromJson(Map<String, dynamic> json) => LearningIdea(
        id: json['id'] as String,
        title: json['title'] as String,
        summary: json['summary'] as String,
        detail: json['body'] as String,
        category: json['category'] as String,
        minutes: json['reading_minutes'] as int,
        sourceName: json['source_name'] as String,
        sourceTitle: json['source_title'] as String,
        sourceUrl: json['source_url'] as String,
        checkedAt: json['checked_at'] as String,
        wordCount: json['word_count'] as int,
      );
}

typedef CatalogLoader = Future<List<LearningIdea>> Function();

/// Bundled text is read once per application session, with no content API.
Future<List<LearningIdea>> loadCatalog() async {
  final raw = await rootBundle.loadString('assets/content/catalog.json');
  final records = jsonDecode(raw) as List<dynamic>;
  return List.unmodifiable(
    records.map(
      (record) => LearningIdea.fromJson(record as Map<String, dynamic>),
    ),
  );
}

List<LearningIdea> filterIdeas(
  Iterable<LearningIdea> ideas, {
  String query = '',
  String? category,
  String group = 'Todas',
}) {
  final terms = normalizeSearch(query).trim().split(RegExp(r'\s+'));
  return ideas.where((idea) {
    if (category != null && idea.category != category) return false;
    if (group == 'Curiosidad' && idea.isProfessional) return false;
    if (group == 'Profesional' && !idea.isProfessional) return false;
    final searchable = normalizeSearch(
      '${idea.title} ${idea.summary} ${idea.detail} ${idea.category}',
    );
    return terms.every(searchable.contains);
  }).toList(growable: false);
}

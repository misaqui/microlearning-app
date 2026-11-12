import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/catalog.dart';
import 'fixtures.dart';

void main() {
  test(
    'catalog has 200 complete unique readings and the exact editorial quotas',
    () {
      final records =
          (jsonDecode(File('assets/content/catalog.json').readAsStringSync())
                  as List)
              .cast<Map<String, dynamic>>();
      expect(records, hasLength(200));
      final ids = <String>{}, titles = <String>{}, bodies = <String>{};
      final counts = <String, int>{};
      for (final record in records) {
        final idea = LearningIdea.fromJson(record);
        expect(ids.add(idea.id), isTrue, reason: 'Duplicate ID ${idea.id}');
        expect(
          titles.add(normalizeSearch(idea.title)),
          isTrue,
          reason: 'Duplicate title ${idea.title}',
        );
        expect(
          bodies.add(normalizeSearch(idea.detail)),
          isTrue,
          reason: 'Duplicate body ${idea.id}',
        );
        final count = idea.detail.trim().split(RegExp(r'\s+')).length;
        expect(count, inInclusiveRange(170, 280), reason: idea.id);
        expect(idea.wordCount, count, reason: idea.id);
        expect(idea.minutes, (count / 200).ceil(), reason: idea.id);
        expect(idea.minutes, inInclusiveRange(1, 2));
        expect(record['language'], 'es');
        expect(idea.summary.trim(), isNotEmpty);
        expect(idea.sourceName.trim(), isNotEmpty);
        expect(idea.sourceTitle.trim(), isNotEmpty);
        final uri = Uri.parse(idea.sourceUrl);
        expect(uri.scheme, 'https');
        expect(uri.host, isNotEmpty);
        expect(uri.path, isNot(anyOf('', '/')), reason: idea.id);
        expect(DateTime.tryParse(idea.checkedAt), isNotNull);
        counts.update(idea.category, (value) => value + 1, ifAbsent: () => 1);
      }
      expect(counts, categoryQuotas);
      final professional = records
          .where((r) => professionalCategories.contains(r['category']))
          .length;
      expect(professional, 50);
      expect(records.length - professional, 150);
    },
  );

  test(
    'search ignores accents and searches all words across title summary body',
    () {
      expect(
        filterIdeas(
          fixtureIdeas,
          query: 'ATENCION cientifico',
        ).map((i) => i.id),
        ['focus'],
      );
      expect(filterIdeas(fixtureIdeas, query: 'no-existe'), isEmpty);
      expect(filterIdeas(fixtureIdeas, group: 'Profesional').map((i) => i.id), [
        'recall',
      ]);
      expect(filterIdeas(fixtureIdeas, group: 'Curiosidad'), hasLength(2));
      expect(filterIdeas(fixtureIdeas, category: 'Psicología'), hasLength(2));
      expect(
        filterIdeas(fixtureIdeas, category: 'Liderazgo', query: 'habitos'),
        isEmpty,
      );
    },
  );
}

import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreState {
  final List<Book> recommendBooks;

  const ExploreState({required this.recommendBooks});
}

class ExploreNotifier extends Notifier<ExploreState> {
  @override
  ExploreState build() {
    return ExploreState(
      recommendBooks: ref.read(bookRepositoryProvider).getRecommendBooks(),
    );
  }
}

final exploreProvider =
    NotifierProvider<ExploreNotifier, ExploreState>(ExploreNotifier.new);

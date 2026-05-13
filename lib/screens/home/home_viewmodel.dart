import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/models/reading_progress.dart';
import 'package:flutter_application_1/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final List<Book> featuredBooks;
  final List<ReadingProgress> readingProgress;
  final bool isStreakOpen;

  const HomeState({
    required this.featuredBooks,
    required this.readingProgress,
    this.isStreakOpen = false,
  });

  HomeState copyWith({
    List<Book>? featuredBooks,
    List<ReadingProgress>? readingProgress,
    bool? isStreakOpen,
  }) {
    return HomeState(
      featuredBooks: featuredBooks ?? this.featuredBooks,
      readingProgress: readingProgress ?? this.readingProgress,
      isStreakOpen: isStreakOpen ?? this.isStreakOpen,
    );
  }
}

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    final repo = ref.read(bookRepositoryProvider);
    return HomeState(
      featuredBooks: repo.getFeaturedBooks(),
      readingProgress: repo.getReadingProgress(),
    );
  }

  void toggleStreak() =>
      state = state.copyWith(isStreakOpen: !state.isStreakOpen);

  void closeStreak() => state = state.copyWith(isStreakOpen: false);
}

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

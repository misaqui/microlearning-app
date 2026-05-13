import 'package:flutter_application_1/models/reading_progress.dart';
import 'books_mock.dart';

final List<ReadingProgress> mockReadingProgress = [
  ReadingProgress(
    book: mockFeaturedBooks[0], // Atomic Habits
    progress: 0.05,
    nextChapter: 'The 1% Rule',
  ),
  ReadingProgress(
    book: mockFeaturedBooks[1], // The Power of Now
    progress: 0.42,
    nextChapter: 'Going Deeply into the Now',
  ),
  ReadingProgress(
    book: mockFeaturedBooks[2], // Ego Is The Enemy
    progress: 0.78,
    nextChapter: 'Maintaining Success',
  ),
];

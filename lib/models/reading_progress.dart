import 'book.dart';

class ReadingProgress {
  final Book book;
  final double progress; // 0.0 to 1.0
  final String nextChapter;

  const ReadingProgress({
    required this.book,
    required this.progress,
    required this.nextChapter,
  });
}

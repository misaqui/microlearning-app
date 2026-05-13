import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/models/reading_progress.dart';

abstract class BookRepository {
  List<Book> getFeaturedBooks();
  List<Book> getRecommendBooks();
  List<ReadingProgress> getReadingProgress();
  Book? getBookById(String id);
}

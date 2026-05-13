import 'package:flutter_application_1/data/mock/books_mock.dart';
import 'package:flutter_application_1/data/mock/reading_progress_mock.dart';
import 'package:flutter_application_1/data/repositories/book_repository.dart';
import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/models/reading_progress.dart';

class MockBookRepository implements BookRepository {
  const MockBookRepository();

  @override
  List<Book> getFeaturedBooks() => mockFeaturedBooks;

  @override
  List<Book> getRecommendBooks() => mockRecommendBooks;

  @override
  List<ReadingProgress> getReadingProgress() => mockReadingProgress;

  @override
  Book? getBookById(String id) {
    try {
      return mockFeaturedBooks.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }
}

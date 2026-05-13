import 'package:flutter_application_1/data/repositories/book_repository.dart';
import 'package:flutter_application_1/data/repositories/mock_book_repository.dart';
import 'package:flutter_application_1/data/repositories/mock_user_repository.dart';
import 'package:flutter_application_1/data/repositories/user_repository.dart';

// Swap MockBookRepository → ApiBookRepository here when the real API is ready.
// Screens never need to change.
class Repositories {
  static final BookRepository books = MockBookRepository();
  static final UserRepository user = MockUserRepository();
}

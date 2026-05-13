import 'package:flutter_application_1/data/repositories/book_repository.dart';
import 'package:flutter_application_1/data/repositories/repositories.dart';
import 'package:flutter_application_1/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Override these providers in tests to inject fakes without touching screens.
final bookRepositoryProvider = Provider<BookRepository>(
  (ref) => Repositories.books,
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => Repositories.user,
);

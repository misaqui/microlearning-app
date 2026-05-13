import 'package:flutter_application_1/data/mock/user_mock.dart';
import 'package:flutter_application_1/data/repositories/user_repository.dart';
import 'package:flutter_application_1/models/user_profile.dart';

class MockUserRepository implements UserRepository {
  const MockUserRepository();

  @override
  UserProfile getUser() => mockUser;
}

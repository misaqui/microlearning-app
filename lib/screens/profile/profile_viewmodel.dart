import 'package:flutter_application_1/models/user_profile.dart';
import 'package:flutter_application_1/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  final UserProfile user;

  const ProfileState({required this.user});
}

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    return ProfileState(user: ref.read(userRepositoryProvider).getUser());
  }
}

final profileProvider =
    NotifierProvider<ProfileNotifier, ProfileState>(ProfileNotifier.new);

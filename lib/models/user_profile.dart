class UserProfile {
  final String id;
  final String name;
  final String username;
  final String avatarUrl;
  final int followers;
  final int following;

  const UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.avatarUrl,
    this.followers = 0,
    this.following = 0,
  });
}

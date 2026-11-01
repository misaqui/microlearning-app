import 'package:shared_preferences/shared_preferences.dart';

abstract interface class FavoriteStore {
  Future<Set<String>> load();
  Future<void> save(Set<String> ids);
}

/// Non-sensitive preferences only; browser storage is not a durable backup.
class LocalFavoriteStore implements FavoriteStore {
  const LocalFavoriteStore();
  static const key = 'microlearning.favorites.v1';

  @override
  Future<Set<String>> load() async {
    final preferences = await SharedPreferences.getInstance();
    return (preferences.getStringList(key) ?? <String>[]).toSet();
  }

  @override
  Future<void> save(Set<String> ids) async {
    final preferences = await SharedPreferences.getInstance();
    final values = ids.toList()..sort();
    if (!await preferences.setStringList(key, values)) {
      throw StateError('Local storage rejected the write');
    }
  }
}

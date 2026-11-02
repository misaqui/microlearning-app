import 'package:flutter_test/flutter_test.dart';
import 'package:microlearning_hub/favorite_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('empty preferences load an empty library', () async {
    SharedPreferences.setMockInitialValues({});
    expect(await const LocalFavoriteStore().load(), isEmpty);
  });

  test(
    'replacement persists deletion without touching unrelated preferences',
    () async {
      SharedPreferences.setMockInitialValues({'unrelated': 'keep'});
      await const LocalFavoriteStore().save({'focus', 'recall'});
      await const LocalFavoriteStore().save({'recall'});
      expect(await const LocalFavoriteStore().load(), {'recall'});
      expect(
        (await SharedPreferences.getInstance()).getString('unrelated'),
        'keep',
      );
      await const LocalFavoriteStore().save({});
      expect(await const LocalFavoriteStore().load(), isEmpty);
    },
  );

  test(
    'malformed stored value is reported rather than silently overwritten',
    () async {
      SharedPreferences.setMockInitialValues({LocalFavoriteStore.key: 123});
      await expectLater(
        const LocalFavoriteStore().load(),
        throwsA(isA<TypeError>()),
      );
      expect(
        (await SharedPreferences.getInstance()).getInt(LocalFavoriteStore.key),
        123,
      );
    },
  );
}

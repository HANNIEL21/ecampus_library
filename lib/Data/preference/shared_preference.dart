import 'package:ecampus_library/data/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * TODO HANDLE SHARED PREFERENCE HERE
 */

const userCategory = 'user-category';

class Preference {
  static void setDownloadStatus(UserCategory category) async {
    final Future<SharedPreferences> _sharedPreference =
        SharedPreferences.getInstance();
    SharedPreferences sharedPreferences = await _sharedPreference;
    await sharedPreferences
        .setString(userCategory, category.name)
        .then((value) => value);
  }

  static Future<void> saveCategory(UserCategory category) async {
    final Future<SharedPreferences> _sharedPreference =
        SharedPreferences.getInstance();
    SharedPreferences sharedPreferences = await _sharedPreference;
    await sharedPreferences
        .setString(userCategory, category.name)
        .then((value) => value);
  }

  static Future<UserCategory?> getCategory() async {
    final Future<SharedPreferences> sharedPreference =
        SharedPreferences.getInstance();
    SharedPreferences sharedPreferences = await sharedPreference;
    final data = sharedPreferences.getString(userCategory);
    if (data == null) {
      return null;
    }
    return UserCategory.values.firstWhere((element) => element.name == data);
  }
}

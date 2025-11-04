import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(key, value);
  }

  static Future<void> setList({
    required String key,
    required List<String> value,
  }) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList(key, value);
  }

  static Future<String?> getString({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<bool?> getBool({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static Future<List<String>> getList({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(key) ?? [];
  }
}

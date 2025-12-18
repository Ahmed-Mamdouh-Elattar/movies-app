import 'package:movies_app/core/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _pref = getIt.get<SharedPreferences>();
  static SharedPreferencesService? _instance;
  SharedPreferencesService._();
  factory SharedPreferencesService() {
    _instance ??= SharedPreferencesService._();
    return _instance!;
  }
  void setString({required String key, required String value}) {
    _pref.setString(key, value);
  }

  void setBool({required String key, required bool value}) {
    _pref.setBool(key, value);
  }

  void setList({required String key, required List<String> value}) {
    _pref.setStringList(key, value);
  }

  String? getString({required String key}) {
    return _pref.getString(key);
  }

  bool? getBool({required String key}) {
    return _pref.getBool(key);
  }

  List<String> getList({required String key}) {
    return _pref.getStringList(key) ?? [];
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> getBool(String key) async {
    await init();
    return _prefs?.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool value) async {
    await init();
    await _prefs?.setBool(key, value);
  }
}

enum StorageEnum { themeIsLight }

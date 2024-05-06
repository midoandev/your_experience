import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static const String tag = 'STORAGE-SERVICE';

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ?? await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<String> getPref({required StorageEnum key}) async {
    var prefs = await _instance;

    var value = prefs.getString(key.name);
    var result = value ?? '';
    // Get.log('$tag getPrefString ${key.name} => $result');
    return result;
  }

  static Future<bool> getPrefBool({required StorageEnum key}) async {
    var prefs = await _instance;
    var value = prefs.getBool(key.name);
    var result = value ?? false;
    // Get.log('$tag getPrefBool ${key.name} => $result');
    return result;
  }

  static Future setPref(
      {required StorageEnum key, required String value}) async {
    var prefs = await _instance;
    await prefs.setString(key.name, value);
    // Get.log('$tag setPrefString ${key.name} => done');
  }

  static Future setPrefBool(
      {required StorageEnum key, required bool value}) async {
    var prefs = await _instance;
    await prefs.setBool(key.name, value);
    // Get.log('$tag setPrefBool ${key.name} => done');
  }

  static clearAllPref() async {
    var prefs = await _instance;
    await prefs.clear();
  }
// Future<SecureSharedPref> init() async {
//   return await SecureSharedPref.getInstance();
// }
// static Future<String> getPref({required StorageEnum key}) async {
//   final pref = Get.find<SecureSharedPref>();
//   var value = await pref.getString(key.name, isEncrypted: true);
//   var result = value ?? '';
//   Get.log('getPrefString ${key.name} => $result');
//   return result;
// }
//
// static Future<bool> getPrefBool({required StorageEnum key}) async {
//   final pref = Get.find<SecureSharedPref>();
//   var value = await pref.getBool(key.name, isEncrypted: true);
//   var result = value ?? false;
//   Get.log('getPrefBool ${key.name} => $result');
//   return result;
// }
//
// static Future setPref(
//     {required StorageEnum key, required String value}) async {
//   final pref = Get.find<SecureSharedPref>();
//   await pref.putString(key.name, value, isEncrypted: true);
//   Get.log('setPrefString ${key.name} => done');
// }
//
// static Future setPrefBool(
//     {required StorageEnum key, required bool value}) async {
//   final pref = Get.find<SecureSharedPref>();
//   await pref.putBool(key.name, value, isEncrypted: true);
//   Get.log('setPrefBool ${key.name} => done');
// }
}

enum StorageEnum {
  authToken,
  userId,
  onBoardingHasPlayed,
  loginAnimateHasPlayed,
  username,
  tokenDevice,
  rememberMe,
  secretKey,
  notification
}

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveDateTime(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  static String? getDateTime(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<bool> removeData(String key) async {
    return await _sharedPreferences.remove(key);
  }
}

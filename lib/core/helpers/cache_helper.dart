import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyUserPhone = 'user_phone';
  static const String keyAuthToken = 'auth_token';

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    final prefs = _sharedPreferences ?? await SharedPreferences.getInstance();
    if (value is String) return await prefs.setString(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is bool) return await prefs.setBool(key, value);
    if (value is double) return await prefs.setDouble(key, value);
    if (value is List<String>) return await prefs.setStringList(key, value);
    return false;
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences?.get(key);
  }

  static String? getString({required String key}) {
    return _sharedPreferences?.getString(key);
  }

  static bool? getBool({required String key}) {
    return _sharedPreferences?.getBool(key);
  }

  static Future<bool> removeData({required String key}) async {
    final prefs = _sharedPreferences ?? await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future<bool> clearAll() async {
    final prefs = _sharedPreferences ?? await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  // Convenient authentication helpers
  static Future<bool> setLoggedIn(bool value) async {
    return await saveData(key: keyIsLoggedIn, value: value);
  }

  static bool isLoggedIn() {
    return getBool(key: keyIsLoggedIn) ?? false;
  }

  static Future<bool> saveUserPhone(String phone) async {
    return await saveData(key: keyUserPhone, value: phone);
  }

  static String? getUserPhone() {
    return getString(key: keyUserPhone);
  }
}

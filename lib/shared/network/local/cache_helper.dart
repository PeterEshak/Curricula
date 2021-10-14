import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreference;

  static Future init() async =>
      sharedPreference = await SharedPreferences.getInstance();

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreference.setBool(key, value);
  }

    static Future<dynamic> putString({
    required String key,
    required String value,
  }) async {
    return await sharedPreference.setString(key, value);
  }

  // static Future<dynamic> putDouble({
  //   required String key,
  //   required double value,
  // }) async {
  //   return await sharedPreference.setDouble(key, value);
  // }

  // static Future<dynamic> putInt({
  //   required String key,
  //   required int value,
  // }) async {
  //   return await sharedPreference.setInt(key, value);
  // }


  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreference.setString(key, value);
    if (value is int) return await sharedPreference.setInt(key, value);
    if (value is bool) return await sharedPreference.setBool(key, value);
    return await sharedPreference.setDouble(key, value);
  }
  
  static dynamic getData({required String key}) {
    return sharedPreference.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreference.remove(key);
  }
}

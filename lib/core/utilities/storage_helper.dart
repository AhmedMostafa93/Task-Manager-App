import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/features%20/login/Data/model/login-response.dart';

class StorageHelper {
  static Future writeToSecureStorage(String key, String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static Future<String> readFromSecureStorage(String key) async {
    String value = "";
    try {
      const storage = FlutterSecureStorage();
      final valueRetrievedFromStorage = await storage.read(key: key);
      value = valueRetrievedFromStorage ?? "";
    } catch (e) {
      return "";
    }
    return value;
  }

  static Future<void> clearSecureStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  static Future<void> saveAuthData(LoginResponse user) async {
    await writeToSecureStorage(ApiConstants.tokenAttribute, user.token ?? "");

    await writeToSecureStorage(
        ApiConstants.userIdAttribute, user.id.toString());
  }
}

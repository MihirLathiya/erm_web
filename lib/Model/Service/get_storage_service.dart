import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();
  static String userId = "userId";
  static String token = "token";

  ///User Id
  static setUserId(String value) async {
    await getStorage.write(userId, value);
  }

  static getUserId() {
    return getStorage.read(userId);
  }

  /// Token
  static setToken(String value) async {
    await getStorage.write(token, value);
  }

  static getToken() {
    return getStorage.read(token);
  }
}

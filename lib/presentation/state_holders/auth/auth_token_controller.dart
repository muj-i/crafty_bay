// class AuthTokenController {
//   static String? _accessToken;

//   static String? get accessToken => _accessToken;

//   static Future<void> setAccessToken(String token) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     await sharedPreferences.setString('access_token', token);
//     _accessToken = token;
//   }

//   static Future<void> getAccessToken() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     _accessToken = sharedPreferences.getString('access_token');
//   }

//   static Future<void> clear() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     await sharedPreferences.clear();
//   }

//   static bool get isLoggedIn {
//     return _accessToken != null;
//   }
// }
import 'package:get_storage/get_storage.dart';

class AuthTokenController {
  static String? _accessToken;

  static final box = GetStorage();

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    await box.write('access_token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final token = box.read('access_token');
    _accessToken = token;
  }

  static Future<void> clear() async {
    await box.remove('access_token');
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}

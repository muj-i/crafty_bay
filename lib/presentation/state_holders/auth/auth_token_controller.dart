import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenController {
  static String? _accessToken;

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = null;
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}

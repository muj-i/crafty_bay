import 'package:shared_preferences/shared_preferences.dart';

class UserDataController {
  static String? _accessFirstName;
  static String? _accesslastName;
  static String? _accessMobile;
  static String? _accessCity;
  static String? _accessShippingAddress;

  static String? get accessFirstName => _accessFirstName;
  static String? get accesslastName => _accesslastName;
  static String? get accessMobile => _accessMobile;
  static String? get accessCity => _accessCity;
  static String? get accessShippingAddress => _accessShippingAddress;

  static Future<void> setAccessToken(
      String firstName, lastName, mobile, city, shippingAddress) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('first_name', firstName);
    await sharedPreferences.setString('last_name', lastName);
    await sharedPreferences.setString('mobile', mobile);
    await sharedPreferences.setString('city', city);
    await sharedPreferences.setString('shipping_address', shippingAddress);
    _accessFirstName = firstName;
    _accesslastName = lastName;
    _accessMobile = mobile;
    _accessCity = city;
    _accessShippingAddress = shippingAddress;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessFirstName = sharedPreferences.getString('first_name');
    _accesslastName = sharedPreferences.getString('last_name');
    _accessMobile = sharedPreferences.getString('mobile');
    _accessCity = sharedPreferences.getString('city');
    _accessShippingAddress = sharedPreferences.getString('shipping_address');
  }

  // static Future<void> clear() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  // }

  // static bool get isLoggedIn {
  //   return _accessFirstName != null;
  // }
}

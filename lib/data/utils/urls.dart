class Urls {
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";

  static  String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";
  static  String listProductSlider = "$_baseUrl/ListProductSlider";
}

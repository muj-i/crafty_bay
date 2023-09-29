class Urls {
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";

  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";
  static String homeSlider = "$_baseUrl/ListProductSlider";
  static String categories = "$_baseUrl/CategoryList";
  static String popularProduct = "$_baseUrl/ListProductByRemark/popular";
  static String specialProduct = "$_baseUrl/ListProductByRemark/special";
  static String newProduct = "$_baseUrl/ListProductByRemark/new";
}

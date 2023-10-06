class Urls {
  Urls._();

  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";

  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";
  static String verifyPin(String email, String pin) =>
      "$_baseUrl/VerifyLogin/$email/$pin";
  static String homeSlider = "$_baseUrl/ListProductSlider";
  static String getCategories = "$_baseUrl/CategoryList";
  static String getProductListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String getPopularProduct = "$_baseUrl/ListProductByRemark/popular";
  static String getSpecialProduct = "$_baseUrl/ListProductByRemark/special";
  static String getNewProduct = "$_baseUrl/ListProductByRemark/new";
  static String getProductDetails(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";
  static const String addToCart = '$_baseUrl/CreateCartList';
}

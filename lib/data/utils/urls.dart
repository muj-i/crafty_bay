class Urls {
  Urls._();

  static const String _baseUrl = "https://ecom-api.teamrabbil.com/api";

  static String verifyEmail(String email) => "$_baseUrl/UserLogin/$email";

  static String verifyPin(String email, String pin) =>
      "$_baseUrl/VerifyLogin/$email/$pin";

  static String readProfile = "$_baseUrl/ReadProfile";

  static String createProfile = "$_baseUrl/CreateProfile";

  static String getHomeSlider = "$_baseUrl/ListProductSlider";

  static String getCategories = "$_baseUrl/CategoryList";

  static String getProductListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String getPopularProduct = "$_baseUrl/ListProductByRemark/popular";

  static String getSpecialProduct = "$_baseUrl/ListProductByRemark/special";

  static String getNewProduct = "$_baseUrl/ListProductByRemark/new";

  static String getProductDetails(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";

  static const String addToCart = '$_baseUrl/CreateCartList';

  static const String getCartList = '$_baseUrl/CartList';

  static String deleteCartItem(String id) => '$_baseUrl/DeleteCartList/$id';

  static String getWishItem = '$_baseUrl/ProductWishList';

  static String createWishItem(int id) => '$_baseUrl/CreateWishList/$id';

  static String deleteWishItem(String id) => '$_baseUrl/RemoveWishList/$id';

  static String getProductReview(int id) => '$_baseUrl/ListReviewByProduct/$id';

  static String createProductReview = '$_baseUrl/CreateProductReview';
}

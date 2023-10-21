import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/create_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/pin_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/categories_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_product_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_item_controller.dart';
import 'package:crafty_bay/presentation/state_holders/get_product_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBaseController());
    Get.put(EmailVerificationController());
    Get.put(PinVerificationController());
    Get.put(ReadProfileController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CategoryProductListController());
    Get.put(CartListController());
    Get.put(DeleteCartItemController());
    Get.put(WishListController());
    Get.put(CreateWishListController());
    Get.put(GetProductReviewController());
    Get.put(CreateProductReviewController());
    Get.put(CreateProfileController());
  }
}

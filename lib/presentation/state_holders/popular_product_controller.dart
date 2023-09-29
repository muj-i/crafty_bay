import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/remark_product/popular_product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  PopularProductModel _popularProductModel = PopularProductModel();
  String _errorMessage = '';

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;

  PopularProductModel get popularProductModel => _popularProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductsInProgress = true;
    update();
    // final NetworkResponse response =
    // await NetworkCaller().getRequest(Urls.getProductsByRemarks('popular'));
    final NetworkResponseRequest response =
        await NetworkResponseCaller().getRequest(Urls.popularProduct);
    _getPopularProductsInProgress = false;
    if (response.isSuccess) {
      _popularProductModel =
          PopularProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
}

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewProductController extends GetxController {
  bool _getNewProductsInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  ProductModel get newProductModel => _newProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponseRequest response =
        await NetworkResponseCaller().getRequest(Urls.newProduct);
    _getNewProductsInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
}

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/remark_product/special_product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductsInProgress = false;
  SpecialProductModel _specialProductModel = SpecialProductModel();
  String _errorMessage = '';

  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;

  SpecialProductModel get specialProductModel => _specialProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductsInProgress = true;
    update();
    // final NetworkResponse response =
    // await NetworkCaller().getRequest(Urls.getProductsByRemarks('popular'));
    final NetworkResponseRequest response =
        await NetworkResponseCaller().getRequest(Urls.specialProduct);
    _getSpecialProductsInProgress = false;
    if (response.isSuccess) {
      _specialProductModel =
          SpecialProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
}

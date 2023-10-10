import 'package:crafty_bay/data/models/cart_and_wish_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;
  String _message = '';
  CartAndWishListModel _cartListModel = CartAndWishListModel();
  bool get getCartListInProgress => _getCartListInProgress;

  String get message => _message;
  CartAndWishListModel get cartListModel => _cartListModel;
  Future<bool> getCartList() async {
    _getCartListInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getCartList);
    _getCartListInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartAndWishListModel.fromJson(response.responseJson!);
      //  _calculateTotalPrice();
      update();
      return true;
    } else {
      _message = 'Get cart list failed! Try again';
      return false;
    }
  }
}

import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class DeleteCartItemController extends GetxController {
  bool _deleteCartItemInProgress = false;
  String _message = '';
  CartListModel _cartListModel = CartListModel();
  bool get deleteCartItemInProgress => _deleteCartItemInProgress;

  String get message => _message;
  CartListModel get cartListModel => _cartListModel;
  Future<bool> deleteCartItem(String id) async {
    _deleteCartItemInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.deleteCartItem(id));
    _deleteCartItemInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Cart item delete failed! Try again';
      return false;
    }
  }
}

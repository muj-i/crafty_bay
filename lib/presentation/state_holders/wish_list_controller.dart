import 'package:crafty_bay/data/models/cart_and_wish_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _message = '';
  CartAndWishListModel _wishListModel = CartAndWishListModel();
  bool get getWishListInProgress => _getWishListInProgress;

  String get message => _message;
  CartAndWishListModel get wishListModel => _wishListModel;
  Future<bool> getWishList() async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getWishItem, loginRequired: true);
    _getWishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel = CartAndWishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Get wish list failed! Try again';
      return false;
    }
  }
}

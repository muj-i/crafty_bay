import 'package:crafty_bay/data/models/cart_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _message = '';
  WishListModel _wishListModel = WishListModel();
  bool get getWishListInProgress => _getWishListInProgress;

  String get message => _message;
  WishListModel get wishListModel => _wishListModel;
  Future<bool> getWishList() async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getWishItem, loginRequired: true);
    _getWishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Get wish list failed! Try again';
      return false;
    }
  }
}

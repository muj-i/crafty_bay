import 'package:crafty_bay/data/models/Wish_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class DeleteWishItemController extends GetxController {
  bool _deleteWishItemInProgress = false;
  String _message = '';
  WishListModel _wishListModel = WishListModel();
  bool get deleteWishItemInProgress => _deleteWishItemInProgress;

  String get message => _message;
  WishListModel get wishListModel => _wishListModel;
  Future<bool> deleteWishItem(String id) async {
    _deleteWishItemInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.deleteWishItem(id));
    _deleteWishItemInProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Wish item delete failed! Try again';
      return false;
    }
  }
}

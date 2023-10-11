import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateWishListController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> createWishList(int id) async {
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.createWishItem(id));
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Create wish list failed! Try again';
      return false;
    }
  }
}

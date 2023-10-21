import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_review_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class GetProductReviewController extends GetxController {
  bool _productReviewInProgress = false;
  String _message = '';
  ProductReviewModel _getProductReviewModel = ProductReviewModel();
  bool get productReviewInProgress => _productReviewInProgress;

  String get message => _message;
  ProductReviewModel get getProductReviewModel => _getProductReviewModel;
  Future<bool> getProductReview(int id) async {
    _productReviewInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductReview(id));
    _productReviewInProgress = false;
    if (response.isSuccess) {
      _getProductReviewModel =
          ProductReviewModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Get product review failed! Try again';
      return false;
    }
  }
}

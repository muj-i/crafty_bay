import 'package:crafty_bay/data/models/get_product_review_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class GetProductReviewController extends GetxController {
  bool _getProductReviewInProgress = false;
  String _message = '';
  GetProductReviewModel _getProductReviewModel = GetProductReviewModel();
  bool get getProductReviewInProgress => _getProductReviewInProgress;

  String get message => _message;
  GetProductReviewModel get getProductReviewModel => _getProductReviewModel;
  Future<bool> getProductReview(int id) async {
    _getProductReviewInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductReview(id));
    _getProductReviewInProgress = false;
    if (response.isSuccess) {
      _getProductReviewModel =
          GetProductReviewModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'Get product review failed! Try again';
      return false;
    }
  }
}

import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController {
  bool _createProductReviewInProgress = false;
  String _message = '';

  bool get createProductReviewInProgress => _createProductReviewInProgress;

  String get message => _message;

  Future<bool> createProductReview(String description, int productId) async {
    _createProductReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        Urls.createProductReview,
        {"description": description, "product_id": productId});
    log(productId.toString());
    log(description);

    _createProductReviewInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Create product review failed! Try again';
      return false;
    }
  }
}

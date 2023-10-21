
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsDataInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  String _errorMessage = '';

 List<String> _availableColors = [];
  List<String> _availableSizes = [];

  bool get getProductDetailsDataInProgress => _getProductDetailsDataInProgress;

  ProductDetailsData get productDetailsData => _productDetailsData;

  List<String> get availableColors => _availableColors;

  List<String> get availableSizes => _availableSizes;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsDataInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductDetails(id));
    _getProductDetailsDataInProgress = false;
    if (response.isSuccess) {
      _productDetailsData =
          (ProductDetailsModel.fromJson(response.responseJson ?? {}))
              .data!
              .first;
      
      _convertStringToColor(_productDetailsData.color ?? '');

      _convertStringToSizes(_productDetailsData.size ?? '');
      
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _convertStringToColor(String colors) {
    _availableColors = colors.split(',');
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}

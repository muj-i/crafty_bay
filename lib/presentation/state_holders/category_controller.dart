import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  String _message = "";
  CategoryModel _categoriesModel = CategoryModel();

  CategoryModel get categoriesModel => _categoriesModel;
  bool get getCategoriesInProgress => _getCategoriesInProgress;
  String get messeage => _message;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getCategories);
    _getCategoriesInProgress = false;

    if (response.isSuccess) {
      _categoriesModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Slider data fetched failed';
      update();
      return false;
    }
  }
}

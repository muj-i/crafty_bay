import 'package:crafty_bay/data/models/categories_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  bool _getCategoriesInProgress = false;
  String _message = "";
  CategoriesModel _categoriesModel = CategoriesModel();

  CategoriesModel get categoriesModel => _categoriesModel;
  bool get getCategoriesInProgress => _getCategoriesInProgress;
  String get messeage => _message;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponseRequest response =
        await NetworkResponseCaller().getRequest(Urls.categories);
    _getCategoriesInProgress = false;

    if (response.isSuccess) {
      _categoriesModel = CategoriesModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Slider data fetched failed';
      update();
      return false;
    }
  }
}

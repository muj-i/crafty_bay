import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/slider_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _getHomeSlidersInProgress = false;
  String _message = "";
  SliderModel _sliderModel = SliderModel();

  SliderModel get sliderModel => _sliderModel;
  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;
  String get messeage => _message;

  Future<bool> getHomeSliders() async {
    _getHomeSlidersInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getHomeSlider);
    _getHomeSlidersInProgress = false;

    if (response.isSuccess) {
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Slider data fetched failed';
      update();
      return false;
    }
  }
}

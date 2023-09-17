import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBaseController());
  }
}

import 'package:crafty_bay/presentation/state_holders/bottom_nav_base_controller.dart';
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controlle.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/home_carousel_slider.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBaseController());
    Get.put(EmailVerificationController());
    Get.put(HomeSliderController());
  }
}

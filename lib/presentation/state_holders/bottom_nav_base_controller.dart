import 'package:get/get.dart';

class BottomNavBaseController extends GetxController {
  int selectedIndex = -0;
  void changeScreen(int index) {
    selectedIndex = index;
    update();
  }

  void backRoHome() {
    changeScreen(0);
  }
}

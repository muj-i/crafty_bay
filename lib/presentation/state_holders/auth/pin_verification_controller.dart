import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:get/get.dart';

class PinVerificationController extends GetxController {
  bool _pinVerificationInProgress = false;
  final String _message = "";
  bool get pinVerificationInProgress => _pinVerificationInProgress;
  String get messeage => _message;

  Future<bool> verifyPin(String email, String pin) async {
    _pinVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.verifyPin(email, pin));
    _pinVerificationInProgress = false;
    update();
    if (response.isSuccess) {
     await AuthTokenController.setAccessToken(response.responseJson?["data"]);

      return true;
    } else {
      return false;
    }
  }
}

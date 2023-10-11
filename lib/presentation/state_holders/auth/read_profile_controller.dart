import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  String _message = '';

  bool get readProfileInProgress => _readProfileInProgress;

  String get message => _message;

  Future<bool> readProfileData() async {
    log(AuthTokenController.accessToken.toString());
    _readProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileInProgress = false;

    if (response.isSuccess) {
      update();
      return true;
    } else {
      log(AuthTokenController.accessToken.toString());
      _message = 'Read Profile failed! Try again';
      return false;
    }
  }
}

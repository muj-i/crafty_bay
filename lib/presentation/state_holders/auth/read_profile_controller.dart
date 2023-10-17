import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/user_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  String _message = '';
  UserProfileModel _readProfileModel = UserProfileModel();

  String get message => _message;
  UserProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readProfile);
    if (response.isSuccess) {
      _readProfileModel = UserProfileModel.fromJson(response.responseJson);
      update();
      return true;
    } else {
      log(AuthTokenController.accessToken.toString());
      _message = 'Read Profile failed! Try again';
      return false;
    }
  }
}

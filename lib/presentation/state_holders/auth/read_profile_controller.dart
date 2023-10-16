import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth/auth_token_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  String _message = '';
  ReadProfileModel _readProfileModel = ReadProfileModel();

  bool get readProfileInProgress => _readProfileInProgress;
  String get message => _message;
  ReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    _readProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.readProfile);
    _readProfileInProgress = false;
    if (response.isSuccess) {
      log(AuthTokenController.accessToken.toString());
      _readProfileModel = ReadProfileModel.fromJson(response.responseJson);
      update();
      log(AuthTokenController.accessToken.toString());
      return true;
    } else {
      log(AuthTokenController.accessToken.toString());
      _message = 'Read Profile failed! Try again';
      return false;
    }
  }
}

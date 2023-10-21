import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  String _message = '';

  bool get createProfileInProgress => _createProfileInProgress;
  String get message => _message;

  Future<bool> createProfileData(
    String customerName,
    customerAddress,
    customerCity,
    customerState,
    customerPostcode,
    customerCountry,
    customerPhone,
    customerFax,
    shippingName,
    shippingAddress,
    shippingCity,
    shippingState,
    shippingPostcode,
    shippingCountry,
    shippingPhone,
  ) async {
    _createProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createProfile,
      {
        "cus_name": customerName,
        "cus_add": customerAddress,
        "cus_city": customerCity,
        "cus_state": customerState,
        "cus_postcode": customerPostcode,
        "cus_country": customerCountry,
        "cus_phone": customerPhone,
        "cus_fax": customerFax,
        "ship_name": shippingName,
        "ship_add": shippingAddress,
        "ship_city": shippingCity,
        "ship_state": shippingState,
        "ship_postcode": shippingPostcode,
        "ship_country": shippingCountry,
        "ship_phone": shippingPhone
      },
    );
    _createProfileInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _message = 'Create Profile failed! Try again';
      return false;
    }
  }
}

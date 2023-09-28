import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/data/models/network_response.dart';
import 'package:http/http.dart';

class NetworkResponseCaller {
  Future<NetworkResponseRequest> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponseRequest(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponseRequest(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponseRequest(false, -1, null);
  }

  Future<NetworkResponseRequest> putRequest(
      String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponseRequest(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin = false) {
          gotoLogin();
        }
      } else {
        return NetworkResponseRequest(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponseRequest(false, -1, null);
  }

  Future<void> gotoLogin() async {
    // await AuthUtility.clearUserInfo();
    // Navigator.pushAndRemoveUntil(
    //     TaskManagerApp.globalKey.currentContext!,
    //     MaterialPageRoute(builder: (context) => LoginScreen()),
    //         (route) => false);
  }
}
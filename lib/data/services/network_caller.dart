import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class NetworkResponseCaller {
  Future<NetworkResponseRequest> getRequest(String url) async {
    Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['msg'] == 'success') {
      return NetworkResponseRequest(
          true, response.statusCode, jsonDecode(response.body));
    } else {}
    return NetworkResponseRequest(false, -1, null);
  }

  Future<NetworkResponseRequest> putRequest(
      String url, Map<String, dynamic> body) async {
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
    } else {}
    return NetworkResponseRequest(false, -1, null);
  }
}

class NetworkResponseRequest {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? responseJson;

  NetworkResponseRequest(this.isSuccess, this.statusCode, this.responseJson);
}


class NetworkResponseRequest {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseJson;

  NetworkResponseRequest(this.isSuccess, this.statusCode, this.responseJson);
}

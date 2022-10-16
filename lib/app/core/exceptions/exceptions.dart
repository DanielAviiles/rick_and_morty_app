import 'package:rick_and_morty_app/app/core/utils/json_utils.dart';
import 'package:rick_and_morty_app/app/data/models/errorapi/error_api.dart';

class ApiException implements Exception {
  ApiException(
      {required this.message,
      required this.body,
      required this.code,
      this.detail});
  final dynamic body;
  final String message;
  final String? detail;
  final int code;

  Map<String, dynamic>? getJsonFromBody() {
    if (body is String) {
      return JsonUtils.convertStringToMap(body as String);
    }
    return null;
  }

  ErrorApi? getErrorApi() {
    if (getJsonFromBody() != null) {
      return ErrorApi.fromJson(getJsonFromBody()!);
    }
    return null;
  }
}

class LocalException implements Exception {
  LocalException({required this.message, required this.data, this.key});
  final dynamic data;
  final String message;
  final String? key;
}

class UnknowException implements Exception {
  UnknowException(this.message, this.exception);
  final String message;
  final dynamic exception;
}

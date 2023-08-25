import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/app/data/models/commonapi/common_api.dart';

part 'api_global_model.g.dart';

@JsonSerializable()
class ApiGlobalModel extends CommonApi {
  ApiGlobalModel({
    int? statusCode,
    String? detail,
    String? key,
    String? message,
    String? messageKey,
    this.data,
  }) : super(
            statusCode: statusCode,
            detail: detail,
            key: key,
            message: message,
            messageKey: messageKey);
  factory ApiGlobalModel.fromJson(Map<String, dynamic> json) =>
      _$ApiGlobalModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ApiGlobalModelToJson(this);
  dynamic data;
}

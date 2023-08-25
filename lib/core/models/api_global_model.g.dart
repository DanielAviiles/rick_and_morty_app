// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_global_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGlobalModel _$ApiGlobalModelFromJson(Map<String, dynamic> json) =>
    ApiGlobalModel(
      statusCode: json['statusCode'] as int?,
      detail: json['detail'] as String?,
      key: json['key'] as String?,
      message: json['message'] as String?,
      messageKey: json['message_key'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ApiGlobalModelToJson(ApiGlobalModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'detail': instance.detail,
      'key': instance.key,
      'message': instance.message,
      'message_key': instance.messageKey,
      'data': instance.data,
    };

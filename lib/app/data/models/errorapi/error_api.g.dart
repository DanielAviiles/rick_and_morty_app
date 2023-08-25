// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorApi _$ErrorApiFromJson(Map<String, dynamic> json) => ErrorApi(
      statusCode: json['statusCode'] as int?,
      detail: json['detail'] as String?,
      key: json['key'] as String?,
      message: json['message'] as String?,
      messageKey: json['message_key'] as String?,
      stackTrace: json['stackTrace'] as String?,
    );

Map<String, dynamic> _$ErrorApiToJson(ErrorApi instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'detail': instance.detail,
      'key': instance.key,
      'message': instance.message,
      'message_key': instance.messageKey,
      'stackTrace': instance.stackTrace,
    };

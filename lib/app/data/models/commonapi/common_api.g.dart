// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonApi _$CommonApiFromJson(Map<String, dynamic> json) => CommonApi(
      statusCode: json['statusCode'] as int?,
      detail: json['detail'] as String?,
      key: json['key'] as String?,
      message: json['message'] as String?,
      messageKey: json['message_key'] as String?,
    );

Map<String, dynamic> _$CommonApiToJson(CommonApi instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'detail': instance.detail,
      'key': instance.key,
      'message': instance.message,
      'message_key': instance.messageKey,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponseModel _$MessageResponseModelFromJson(
        Map<String, dynamic> json) =>
    MessageResponseModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$MessageResponseModelToJson(
        MessageResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/core/entities/message_entity.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageResponseModel extends MessageResponseEntity {
  const MessageResponseModel({
    required super.title,
    required super.description,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseModelToJson(this);
}

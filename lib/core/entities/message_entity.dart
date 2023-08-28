import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class MessageResponseEntity extends Equatable {
  const MessageResponseEntity({
    required this.title,
    required this.description,
  });

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  const MessageResponseEntity.empty()
      : title = '',
        description = '';

  @override
  List<Object?> get props => [title, description];
}

import 'package:rick_and_morty_app/core/models/message_response/message_model.dart';

import 'message_entity.dart';

class ResponseApiGenericEntity<T> {
  const ResponseApiGenericEntity({
    required this.success,
    required this.messageReponse,
    this.result,
  });

  final bool success;
  final MessageResponseEntity messageReponse;
  final T? result;

  const ResponseApiGenericEntity.empty()
      : success = false,
        messageReponse = const MessageResponseEntity.empty(),
        result = null;

  static ResponseApiGenericEntity<T>? fromJson<T>({
    dynamic instance,
    required Map<String, dynamic> json,
    T Function(List<dynamic>)? serealizeList,
  }) {
    return ResponseApiGenericEntity<T>(
      success: json['success'] ?? false,
      messageReponse: json.containsKey('message')
          ? MessageResponseModel.fromJson(json['message'])
          : const MessageResponseEntity.empty(),
      result: json.containsKey('result')
          ? serealizeList != null
              ? serealizeList(json['result'])
              : instance?.fromJson(json['result'])
          : null,
    );
  }

  ResponseApiGenericEntity<T> copyWith({
    bool? success,
    MessageResponseEntity? messageReponse,
    T? result,
  }) =>
      ResponseApiGenericEntity<T>(
        success: success ?? this.success,
        messageReponse: messageReponse ?? this.messageReponse,
        result: result ?? this.result,
      );
}

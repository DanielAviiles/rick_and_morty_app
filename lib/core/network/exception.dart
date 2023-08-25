// This class is to capture the server events  that return Exception

class ServerException implements Exception {
  final String? message;

  ServerException({
    this.message,
  }) : super();
}

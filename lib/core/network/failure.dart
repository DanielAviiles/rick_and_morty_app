/// This class is abstract to allow condition the functional methods and allow capture the failure events

abstract class Failure {}

// This class capture the failure error the methods to fuctional level
class ErrorFailure extends Failure {
  final Object? error;

  ErrorFailure({
    this.error
  });
}

// This class capture the failure error the methods to api call service
class ServerFailure extends Failure {
  final Object? message;

  ServerFailure({
    this.message
  });
}

//General failures

class CacheFailure extends Failure {
  final Object? message;

  CacheFailure({
    this.message,
  });
}

class ConnectionFailure extends Failure {
  final Object? message;

  ConnectionFailure({
    this.message,
  });
}

class AuthenticationFailure extends Failure {
  final Object? message;

  AuthenticationFailure({
    this.message,
  });
}

class SynchronizationFailure extends Failure {
  final Object? message;

  SynchronizationFailure({
    this.message,
  });
}

class DataBaseFailure extends Failure {
  final Object? message;

  DataBaseFailure({
    this.message,
  });
}

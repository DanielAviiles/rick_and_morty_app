import 'package:rick_and_morty_app/core/network/failure.dart';

String recognizedMessageFailure(dynamic failure) {
  if (failure is ServerFailure ||
      failure is CacheFailure ||
      failure is ConnectionFailure ||
      failure is AuthenticationFailure ||
      failure is SynchronizationFailure ||
      failure is DataBaseFailure) {
    return failure.message.toString();
  } else if (failure is ErrorFailure) {
    return failure.error.toString();
  }
  return 'Unknown failure';
}

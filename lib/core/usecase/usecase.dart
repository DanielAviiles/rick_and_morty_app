import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/network/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  List<Object> get props => [];
}
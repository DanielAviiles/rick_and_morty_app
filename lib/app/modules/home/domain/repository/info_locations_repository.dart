import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';

abstract class InfoLocationsRepository {
  Future<Either<Failure, String>>? getNameLocationWithMoreCharacters();
}

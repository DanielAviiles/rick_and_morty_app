import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';

abstract class InfoEpisodesRepository {
  Future<Either<Failure, int>>? getNumberEpisodes();
}

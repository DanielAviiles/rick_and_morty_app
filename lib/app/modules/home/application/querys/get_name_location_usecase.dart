import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/usecase/query.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_locations_repository.dart';

@injectable
class GetLocationNameUseCase
    extends Query<Either<Failure, String>, NoParams> {
  GetLocationNameUseCase(this.infoLocationsRepository);
  final InfoLocationsRepository infoLocationsRepository;

  @override
  Future<Either<Failure, String>?> execute(NoParams params) async =>
      infoLocationsRepository.getNameLocationWithMoreCharacters();
}

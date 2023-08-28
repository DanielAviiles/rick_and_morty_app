/* import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/usecase/query.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_episodes_repository.dart';

@injectable
class GetNumberEpisodesUseCase extends Query<Either<Failure, int>, NoParams> {
  GetNumberEpisodesUseCase(this.infoEpisodesRepository);
  final InfoEpisodesRepository infoEpisodesRepository;

  @override
  Future<Either<Failure, int>?> execute(NoParams params) async =>
      infoEpisodesRepository.getNumberEpisodes();
}
 */
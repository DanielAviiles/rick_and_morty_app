import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/usecase/query.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_character_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCharactersUseCase
    extends Query<Either<Failure, List<InfoCharacterDom>>, int> {
  GetCharactersUseCase(this.infoCharacterRepository);
  final InfoCharacterRepository infoCharacterRepository;
  @override
  Future<Either<Failure, List<InfoCharacterDom>>?> execute(int params) async =>
      infoCharacterRepository.getCharacters(params);
}

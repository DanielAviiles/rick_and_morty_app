/* import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/usecase/query.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/repository/detail_character_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCharacterUseCase
    extends Query<Either<Failure, DetailCharacterDom>, int> {
  GetCharacterUseCase(this.detailCharacterRepository);
  final DetailCharacterRepository detailCharacterRepository;
  @override
  Future<Either<Failure, DetailCharacterDom>?> execute(int params) async =>
      detailCharacterRepository.getCharacterById(params);
}
 */
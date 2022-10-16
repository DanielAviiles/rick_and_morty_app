import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';

abstract class InfoCharacterRepository {
  Future<Either<Failure, List<InfoCharacterDom>>>? getCharacters(int page);
}

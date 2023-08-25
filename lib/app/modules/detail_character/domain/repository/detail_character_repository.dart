import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';

abstract class DetailCharacterRepository {
  Future<Either<Failure, DetailCharacterDom>>? getCharacterById(int id);
}

import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';
import 'package:rick_and_morty_app/core/network/failure.dart';

abstract class DetailCharacterRepository {
  Future<Either<Failure, DetailCharacterDom>>? getCharacterById(int id);
}

import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/app/core/api/api_route_config.dart';
import 'package:rick_and_morty_app/app/core/constant/server_constant.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/exceptions/exceptions.dart';
import 'package:rick_and_morty_app/app/core/infrastructure/remote_datasource.dart';
import 'package:rick_and_morty_app/app/core/infrastructure/remote_datasource_types.dart';
import 'package:rick_and_morty_app/app/core/models/api_global_model.dart';
import 'package:rick_and_morty_app/app/data/models/character/character_model.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/repository/detail_character_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DetailCharacterRepository)
class DetailCharacterRepositoryRemoteImpl implements DetailCharacterRepository {
  DetailCharacterRepositoryRemoteImpl(
      @Named(RemoteDataSourceTypes.HTTP_DATASOURCE) this._api);

  final RemoteDataSource _api;

  @override
  Future<Either<Failure, DetailCharacterDom>>? getCharacterById(int id) async {
    try {
      String endPoint = '${ApiRouteConfig.baseUrl}/character/$id';
      final response = await _api.get(enpoint: endPoint, timeOutSec: 5);
      if (response.body != null) {
        final apiGlobalModel = ApiGlobalModel.fromJson({
          'data': response.body!,
          'statusCode': response.code,
        });
        final characterModel = CharacterModel.fromJson(apiGlobalModel.data);
        return Right<Failure, DetailCharacterDom>(
          DetailCharacterDom(
            id: characterModel.id,
            name: characterModel.name,
            image: characterModel.image,
            gender: characterModel.gender!,
            species: characterModel.species,
            origin: characterModel.origin!['name'],
            location: characterModel.location!['name'],
            numberEpisodes: characterModel.episode?.length ?? 0
          ),
        );
      }
      return Failure.error(
        ServerConstant.unknowError,
        'unknowError: ${response.message}',
        ex: UnknowException('unknowError: ${response.message}', null),
      );
    } on TimeoutException catch (_) {
      return Failure.error(ServerConstant.timeOutException, _.message, ex: _);
    } on SocketException catch (_) {
      return Failure.error(ServerConstant.socketException, _.message, ex: _);
    } on ApiException catch (_) {
      return Failure.error(
          _.getErrorApi()?.messageKey, _.getErrorApi()?.message,
          ex: _);
    } catch (e) {
      return Failure.error(ServerConstant.unknowError, e.toString(),
          ex: UnknowException(e.toString(), null));
    }
  }
}

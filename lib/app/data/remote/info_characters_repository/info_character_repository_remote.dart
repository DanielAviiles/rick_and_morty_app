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
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_character_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InfoCharacterRepository)
class InfoCharacterRepositoryRemoteImpl implements InfoCharacterRepository {
  InfoCharacterRepositoryRemoteImpl(
      @Named(RemoteDataSourceTypes.HTTP_DATASOURCE) this._api);

  final RemoteDataSource _api;

  @override
  Future<Either<Failure, List<InfoCharacterDom>>>? getCharacters(
      int page) async {
    try {
      String endPoint = '${ApiRouteConfig.baseUrl}/character/?page=$page';
      final response = await _api.get(enpoint: endPoint, timeOutSec: 5);
      if (response.body != null) {
        final apiGlobalModel = ApiGlobalModel.fromJson({
          'data': response.body!,
          'statusCode': response.code,
        });
        final listCharacterModel =
            CharacterModel.listFromJson(apiGlobalModel.data['results'] as List);
        final listInfoCharacterDom = listCharacterModel
            .map((e) => InfoCharacterDom(
                  id: e.id,
                  name: e.name,
                  image: e.image,
                  species: e.species,
                  status: e.status,
                ))
            .toList();
        return Right<Failure, List<InfoCharacterDom>>(listInfoCharacterDom);
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

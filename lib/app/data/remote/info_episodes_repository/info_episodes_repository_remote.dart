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
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_episodes_repository.dart';

@Injectable(as: InfoEpisodesRepository)
class InfoEpisodesRepositoryRemoteImpl implements InfoEpisodesRepository {
  InfoEpisodesRepositoryRemoteImpl(
      @Named(RemoteDataSourceTypes.HTTP_DATASOURCE) this._api);

  final RemoteDataSource _api;

  @override
  Future<Either<Failure, int>>? getNumberEpisodes() async {
    try {
      int page = 1;
      String endPoint = '${ApiRouteConfig.baseUrl}/episode?page=$page';
      final response = await _api.get(enpoint: endPoint, timeOutSec: 5);
      if (response.body != null) {
        final apiGlobalModel = ApiGlobalModel.fromJson({
          'data': response.body!,
          'statusCode': response.code,
        });
        int numberPages = apiGlobalModel.data['info']['pages'];
        if (numberPages > 1) {
          num numberEpisodes = apiGlobalModel.data['results'].length;
          for (int i = page + 1; i < numberPages + 1; i++) {
            final responsePage =
                await _api.get(enpoint: endPoint, timeOutSec: 5);
            if (responsePage.body != null) {
              numberEpisodes += responsePage.body!['results'].length;
            }
          }
          return Right<Failure, int>(numberEpisodes.toInt());
        } else {
          return Right<Failure, int>(apiGlobalModel.data['results'].length);
        }
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

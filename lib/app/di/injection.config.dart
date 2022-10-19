// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import '../core/infrastructure/remote/http/http_datasource_impl.dart' as _i4;
import '../core/infrastructure/remote_datasource.dart' as _i3;
import '../data/remote/detail_character_repository/detail_character_repository_remote.dart'
    as _i7;
import '../data/remote/info_characters_repository/info_character_repository_remote.dart'
    as _i10;
import '../data/remote/info_episodes_repository/info_episodes_repository_remote.dart'
    as _i12;
import '../data/remote/info_locations_repository/info_locations_repository_remote.dart'
    as _i14;
import '../modules/detail_character/application/querys/get_character_usecase.dart'
    as _i8;
import '../modules/detail_character/domain/repository/detail_character_repository.dart'
    as _i6;
import '../modules/home/application/querys/get_characters_usecase.dart' as _i15;
import '../modules/home/application/querys/get_info_episodes_usecase.dart'
    as _i17;
import '../modules/home/application/querys/get_name_location_usecase.dart'
    as _i16;
import '../modules/home/domain/repository/info_character_repository.dart'
    as _i9;
import '../modules/home/domain/repository/info_episodes_repository.dart'
    as _i11;
import '../modules/home/domain/repository/info_locations_repository.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.RemoteDataSource>(
    () => _i4.HttpDataSourceImpl(get<_i5.Client>()),
    instanceName: 'HTTP_DATASOURCE',
  );
  gh.factory<_i6.DetailCharacterRepository>(() =>
      _i7.DetailCharacterRepositoryRemoteImpl(
          get<_i3.RemoteDataSource>(instanceName: 'HTTP_DATASOURCE')));
  gh.factory<_i8.GetCharacterUseCase>(
      () => _i8.GetCharacterUseCase(get<_i6.DetailCharacterRepository>()));
  gh.factory<_i9.InfoCharacterRepository>(() =>
      _i10.InfoCharacterRepositoryRemoteImpl(
          get<_i3.RemoteDataSource>(instanceName: 'HTTP_DATASOURCE')));
  gh.factory<_i11.InfoEpisodesRepository>(() =>
      _i12.InfoEpisodesRepositoryRemoteImpl(
          get<_i3.RemoteDataSource>(instanceName: 'HTTP_DATASOURCE')));
  gh.factory<_i13.InfoLocationsRepository>(() =>
      _i14.InfoLocationsRepositoryRemoteImpl(
          get<_i3.RemoteDataSource>(instanceName: 'HTTP_DATASOURCE')));
  gh.factory<_i15.GetCharactersUseCase>(
      () => _i15.GetCharactersUseCase(get<_i9.InfoCharacterRepository>()));
  gh.factory<_i16.GetLocationNameUseCase>(
      () => _i16.GetLocationNameUseCase(get<_i13.InfoLocationsRepository>()));
  gh.factory<_i17.GetNumberEpisodesUseCase>(
      () => _i17.GetNumberEpisodesUseCase(get<_i11.InfoEpisodesRepository>()));
  return get;
}

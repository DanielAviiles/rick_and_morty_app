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
import '../data/remote/info_characters_repository/info_character_repository_remote.dart'
    as _i7;
import '../modules/home/application/querys/get_characters_usecase.dart' as _i8;
import '../modules/home/domain/repository/info_character_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.InfoCharacterRepository>(() =>
      _i7.InfoCharacterRepositoryRemoteImpl(
          get<_i3.RemoteDataSource>(instanceName: 'HTTP_DATASOURCE')));
  gh.factory<_i8.GetCharactersUseCase>(
      () => _i8.GetCharactersUseCase(get<_i6.InfoCharacterRepository>()));
  return get;
}

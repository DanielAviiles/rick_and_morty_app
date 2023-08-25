// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../app/data/remote/detail_character_repository/detail_character_repository_remote.dart'
    as _i4;
import '../../app/data/remote/info_characters_repository/info_character_repository_remote.dart'
    as _i7;
import '../../app/data/remote/info_episodes_repository/info_episodes_repository_remote.dart'
    as _i9;
import '../../app/data/remote/info_locations_repository/info_locations_repository_remote.dart'
    as _i11;
import '../../app/modules/detail_character/application/querys/get_character_usecase.dart'
    as _i5;
import '../../app/modules/detail_character/domain/repository/detail_character_repository.dart'
    as _i3;
import '../../app/modules/home/application/querys/get_characters_usecase.dart'
    as _i14;
import '../../app/modules/home/application/querys/get_info_episodes_usecase.dart'
    as _i16;
import '../../app/modules/home/application/querys/get_name_location_usecase.dart'
    as _i15;
import '../../app/modules/home/domain/repository/info_character_repository.dart'
    as _i6;
import '../../app/modules/home/domain/repository/info_episodes_repository.dart'
    as _i8;
import '../../app/modules/home/domain/repository/info_locations_repository.dart'
    as _i10;
import '../network/network_info.dart' as _i12;
import 'register_module.dart' as _i17;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initConfigInjection(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.DetailCharacterRepository>(
      () => _i4.DetailCharacterRepositoryRemoteImpl(gh<InvalidType>()));
  gh.factory<_i5.GetCharacterUseCase>(
      () => _i5.GetCharacterUseCase(gh<_i3.DetailCharacterRepository>()));
  gh.factory<_i6.InfoCharacterRepository>(
      () => _i7.InfoCharacterRepositoryRemoteImpl(gh<InvalidType>()));
  gh.factory<_i8.InfoEpisodesRepository>(
      () => _i9.InfoEpisodesRepositoryRemoteImpl(gh<InvalidType>()));
  gh.factory<_i10.InfoLocationsRepository>(
      () => _i11.InfoLocationsRepositoryRemoteImpl(gh<InvalidType>()));
  gh.factory<_i12.NetworkInfoRepository>(
      () => _i12.NetworkInfoRepositoryImpl());
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i14.GetCharactersUseCase>(
      () => _i14.GetCharactersUseCase(gh<_i6.InfoCharacterRepository>()));
  gh.factory<_i15.GetLocationNameUseCase>(
      () => _i15.GetLocationNameUseCase(gh<_i10.InfoLocationsRepository>()));
  gh.factory<_i16.GetNumberEpisodesUseCase>(
      () => _i16.GetNumberEpisodesUseCase(gh<_i8.InfoEpisodesRepository>()));
  return getIt;
}

class _$RegisterModule extends _i17.RegisterModule {}

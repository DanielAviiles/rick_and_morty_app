// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rick_and_morty_app/app/data/remote/detail_character_repository/detail_character_repository_remote.dart'
    as _i4;
import 'package:rick_and_morty_app/app/data/remote/info_characters_repository/info_character_repository_remote.dart'
    as _i9;
import 'package:rick_and_morty_app/app/data/remote/info_episodes_repository/info_episodes_repository_remote.dart'
    as _i11;
import 'package:rick_and_morty_app/app/data/remote/info_locations_repository/info_locations_repository_remote.dart'
    as _i13;
import 'package:rick_and_morty_app/app/modules/detail_character/application/querys/get_character_usecase.dart'
    as _i5;
import 'package:rick_and_morty_app/app/modules/detail_character/domain/repository/detail_character_repository.dart'
    as _i3;
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_characters_usecase.dart'
    as _i14;
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_info_episodes_usecase.dart'
    as _i16;
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_name_location_usecase.dart'
    as _i15;
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_character_repository.dart'
    as _i8;
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_episodes_repository.dart'
    as _i10;
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_locations_repository.dart'
    as _i12;
import 'package:rick_and_morty_app/core/infrastructure/remote/http/http_datasource_impl.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.DetailCharacterRepository>(
        () => _i4.DetailCharacterRepositoryRemoteImpl(gh<InvalidType>()));
    gh.factory<_i5.GetCharacterUseCase>(
        () => _i5.GetCharacterUseCase(gh<_i3.DetailCharacterRepository>()));
    gh.factory<_i6.HttpDataSourceImpl>(
        () => _i6.HttpDataSourceImpl(gh<_i7.Client>()));
    gh.factory<_i8.InfoCharacterRepository>(
        () => _i9.InfoCharacterRepositoryRemoteImpl(gh<InvalidType>()));
    gh.factory<_i10.InfoEpisodesRepository>(
        () => _i11.InfoEpisodesRepositoryRemoteImpl(gh<InvalidType>()));
    gh.factory<_i12.InfoLocationsRepository>(
        () => _i13.InfoLocationsRepositoryRemoteImpl(gh<InvalidType>()));
    gh.factory<_i14.GetCharactersUseCase>(
        () => _i14.GetCharactersUseCase(gh<_i8.InfoCharacterRepository>()));
    gh.factory<_i15.GetLocationNameUseCase>(
        () => _i15.GetLocationNameUseCase(gh<_i12.InfoLocationsRepository>()));
    gh.factory<_i16.GetNumberEpisodesUseCase>(
        () => _i16.GetNumberEpisodesUseCase(gh<_i10.InfoEpisodesRepository>()));
    return this;
  }
}

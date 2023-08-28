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
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../network/network_info.dart' as _i3;
import 'register_module.dart' as _i5;

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
  gh.factory<_i3.NetworkInfoRepository>(() => _i3.NetworkInfoRepositoryImpl());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  return getIt;
}

class _$RegisterModule extends _i5.RegisterModule {}

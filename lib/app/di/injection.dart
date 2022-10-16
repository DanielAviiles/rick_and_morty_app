import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_characters_usecase.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/repository/info_character_repository.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/bloc/home_bloc.dart';
import 'injection.config.dart';

final GetIt getItApp = GetIt.instance;

@injectableInit
void configureAppInjection() {
  unregisterServices();
  registerCustoms();
  $initGetIt(getItApp);
}

void registerCustoms() {
  getItApp.registerLazySingleton(() => client.Client());
  getItApp
      .registerLazySingleton(() => HomeBloc(getCharactersUseCase: getItApp()));
}

void unregisterServices() {
  // REPOSITORY
  removeRegistrationIfExists<InfoCharacterRepository>();

  // USESCASES
  removeRegistrationIfExists<GetCharactersUseCase>();
}

void removeRegistrationIfExists<T extends Object>({String? instanceName}) {
  if (getItApp.isRegistered<T>(instanceName: instanceName)) {
    getItApp.unregister<T>(instanceName: instanceName);
  }
}

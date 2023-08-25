import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_app/core/injection/all_remove_register_injection.dart';
import 'package:rick_and_morty_app/core/injection/core_di.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initConfigInjection',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> injectDependencies() async {
  getIt.pushNewScope();

  allRemoveRegisterInjection();
  await $initConfigInjection(getIt);

  await initCoreDependencies();
}

void removeRegistrationIfExists<T extends Object>({String? instanceName}) {
  if (getIt.isRegistered<T>(instanceName: instanceName)) {
    getIt.unregister<T>(instanceName: instanceName);
  }
}

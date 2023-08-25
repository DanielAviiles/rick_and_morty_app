import 'package:rick_and_morty_app/core/injection/injection_container.dart';
import 'package:rick_and_morty_app/core/network/network_info.dart';
import 'package:rick_and_morty_app/core/network/server_api_client.dart';

Future<void> initCoreDependencies() async {
  getIt.registerLazySingleton(
      () => ServerApiClient(networkInfoRepository: getIt()));
}

void unregisterServices() {
  removeRegistrationIfExists<NetworkInfoRepository>();
  removeRegistrationIfExists<ServerApiClient>();
}

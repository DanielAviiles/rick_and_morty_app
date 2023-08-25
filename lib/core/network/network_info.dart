import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// class Conditional  abstract to validate network or internet connection
abstract class NetworkInfoRepository {
  //This methos validate the internet connection with  mobile data or wifi data
  Future<bool> get hasConnection;
}

@Injectable(as: NetworkInfoRepository)
/// Class to implement the validation network or internet connection
class NetworkInfoRepositoryImpl extends NetworkInfoRepository {
  @override
  Future<bool> get hasConnection async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool result = false;

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        ///I am connected to mobile
        result = true;
        break;
      case ConnectivityResult.wifi:
        ///I am connected to wifi
        result = true;
        break;
      default:
        result = false;
    }

    return result;
  }
}

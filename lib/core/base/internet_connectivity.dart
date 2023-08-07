import 'package:connectivity_plus/connectivity_plus.dart';

mixin InternetConnectivity {
  Future<ConnectivityResult> checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult;
  }
}
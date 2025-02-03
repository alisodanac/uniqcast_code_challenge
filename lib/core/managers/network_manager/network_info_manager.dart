import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfoManager {
  Future<bool> get isConnected;
}

class NetworkInfoManagerImpl implements NetworkInfoManager {
  NetworkInfoManagerImpl._();
  static NetworkInfoManagerImpl instance = NetworkInfoManagerImpl._();
  final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker.createInstance();
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
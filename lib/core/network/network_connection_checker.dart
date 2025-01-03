import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkConnectionChecker {
  Future<bool> get isConnected;
}

class NetworkConnectionCheckImpl implements NetworkConnectionChecker {
  final InternetConnectionChecker connectionChecker;

  NetworkConnectionCheckImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

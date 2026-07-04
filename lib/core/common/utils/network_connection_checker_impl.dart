import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_connection_checker.dart';

@LazySingleton(as: NetworkConnectionChecker)
class NetworkConnectionCheckImpl implements NetworkConnectionChecker {
  final InternetConnectionChecker connectionChecker;

  NetworkConnectionCheckImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

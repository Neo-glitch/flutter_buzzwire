import 'package:buzzwire/core/common/utils/network_connection_checker.dart';
import 'package:buzzwire/injector.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/package_info_helper.dart';

Future<void> provideCommonDependencies() async {
  final packageInfoHelper = PackageInfoHelper();
  await packageInfoHelper.init();
  injector.registerLazySingleton<InternetConnectionChecker>(
          () => InternetConnectionChecker());
  injector.registerLazySingleton<NetworkConnectionChecker>(
          () => NetworkConnectionCheckImpl(connectionChecker: injector()));
  injector.registerLazySingleton<PackageInfoHelper>(() => packageInfoHelper);
}
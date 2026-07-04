import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/package_info_helper.dart';

@module
abstract class CommonModule {
  @lazySingleton
  InternetConnectionChecker get connectionChecker => InternetConnectionChecker();

  @preResolve
  @lazySingleton
  Future<PackageInfoHelper> packageInfoHelper() async {
    final helper = PackageInfoHelper();
    await helper.init();
    return helper;
  }
}

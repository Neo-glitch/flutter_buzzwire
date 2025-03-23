import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoHelper {
  PackageInfo? packageInfo;

  Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}

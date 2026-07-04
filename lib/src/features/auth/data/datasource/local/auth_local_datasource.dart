import '../../../../../../core/cache/buzzwire_app_cache.dart';

abstract class AuthLocalDataSource {
  bool checkIfAunthenticated();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final BuzzWireAppCache appPreference;

  AuthLocalDataSourceImpl({required this.appPreference});

  @override
  bool checkIfAunthenticated() {
    return false;
  }

  void login() {}

  void logOut() {}
}

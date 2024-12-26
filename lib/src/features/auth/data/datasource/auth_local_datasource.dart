import '../../../../../core/utils/local_storage/shared_preference_util.dart';

abstract class AuthLocalDataSource {
  bool checkIfAunthenticated();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final BuzzWireSharedPref appPreference;

  AuthLocalDataSourceImpl({required this.appPreference});

  @override
  bool checkIfAunthenticated() {
    return false;
  }

  void login() {}

  void logOut() {}
}

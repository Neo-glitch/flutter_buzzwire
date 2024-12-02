import '../../../../../core/utils/local_storage/shared_preference_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_local_datasource.g.dart';

@riverpod
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return AuthLocalDataSourceImpl(
      appPreference: ref.read(buzzWireSharedPrefProvider));
}

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

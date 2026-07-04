import '../../../injector.dart';
import '../firebase_remote_config_helper.dart';

Future<void> provideConfigDependencies() async {
  final firebaseRemoteConfigHelper = FirebaseRemoteConfigHelper();
  await firebaseRemoteConfigHelper.init();

  injector.registerLazySingleton<FirebaseRemoteConfigHelper>(
          () => firebaseRemoteConfigHelper);
}
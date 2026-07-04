import 'package:buzzwire/injector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> provideNotificationDependencies() async {
  injector.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);
}

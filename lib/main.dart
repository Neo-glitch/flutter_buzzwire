import 'package:buzzwire/core/constants/app_constants.dart';
import 'package:buzzwire/core/constants/app_secrets.dart';
import 'package:buzzwire/src/features/notification/data/services/buzzwire_messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../core/utils/device/device_utility.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'injector.dart' as di;
import 'src/shared/presentation/riverpod/provider_observer.dart';

/// to handle background messages i.e when app is in background or terminated state
/// Used when data alone remote messages are sent to the app, can be used to make update preferences
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // init any dependencies you will need
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
}

void main() async {
  // Todo: Await SplashScreen

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: BuzzWireAppConstants.baseUrl,
    anonKey: AppSecrets.supabaseApiKey,
  );

  runApp(
    ProviderScope(
      observers: [
        MyObserver(),
      ],
      child: const App(),
    ),
  );
}

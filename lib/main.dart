import 'package:buzzwire/core/common/utils/device_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'package:buzzwire/core/presentation/controllers/app_entry_controller.dart';
import 'package:buzzwire/core/presentation/controllers/auth_controller.dart';
import 'package:buzzwire/theme_controller.dart';
import 'firebase_options.dart';
import 'injector.dart';
import 'package:buzzwire/core/common/logging/provider_observer.dart';

/// to handle background messages i.e when app is in background or terminated state
/// Used when data alone remote messages are sent to the app, can be used to make update preferences
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // init any dependencies needed
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  BuzzWireDeviceUtils.setPreferredOrientation([DeviceOrientation.portraitUp]);
  final container = ProviderContainer(observers: [MyObserver()]);
  // Load async cached values the router redirect and theme need before the
  // first frame so routing and theme never start from an unknown state.
  await Future.wait([
    container.read(appEntryControllerProvider.future),
    container.read(authControllerProvider.future),
    container.read(themeControllerProvider.future),
  ]);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

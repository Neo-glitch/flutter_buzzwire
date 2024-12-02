import 'app.dart';
import 'core/common/riverpod/provider_observer.dart';
import 'core/utils/device/device_utility.dart';
import 'core/utils/local_storage/shared_preference_util.dart';
import 'core/utils/logging/logger_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  // Todo: Init Provider Scope
  // Todo: Init localStorage
  // Todo: Await SplashScreen
  // Todo: Init Firebase
  // Todo: Init Authentication

  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [
        preferencesProvider.overrideWithValue(pref),
      ],
      observers: [
        MyObserver(),
      ],
      child: App(),
    ),
  );
}

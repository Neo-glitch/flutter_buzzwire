import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'injector.dart' as di;
import 'src/shared/presentation/riverpod/provider_observer.dart';

void main() async {
  // Todo: Init Provider Scope
  // Todo: Init localStorage
  // Todo: Await SplashScreen
  // Todo: Init Firebase
  // Todo: Init Authentication

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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

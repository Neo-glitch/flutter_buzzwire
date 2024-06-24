import 'package:buzzwire/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  // Todo: Init Provider Scope
  // Todo: Init localStorage
  // Todo: Await SplashScreen
  // Todo: Init Firebase
  // Todo: Init Authentication

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(child: App()),
  );
}

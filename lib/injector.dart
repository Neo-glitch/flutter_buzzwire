import 'package:buzzwire/core/network/dio/dio_client.dart';
import 'package:buzzwire/core/utils/local_storage/shared_preference_util.dart';
import 'package:buzzwire/src/features/auth/di/auth_dependcies.dart';
import 'package:buzzwire/src/features/news/di/news_dependencies.dart';
import 'package:buzzwire/src/features/profile/di/profile_dependencies.dart';
import 'package:buzzwire/src/features/search_history/di/search_history_dependencies.dart';
import 'package:buzzwire/src/features/settings/di/settings_dependencies.dart';
import 'package:buzzwire/src/shared/data/datasources/local/app_database.dart';
import 'package:buzzwire/src/shared/data/manager/app_theme_manager_impl.dart';
import 'package:buzzwire/src/shared/di/shared_dependencies.dart';
import 'package:buzzwire/src/shared/domain/manager/app_theme_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final injector = GetIt.instance;

Future<void> init() async {
  final pref = await SharedPreferences.getInstance();
  final appDatabase =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();

  injector.registerLazySingleton<AppDatabase>(() => appDatabase);
  injector.registerLazySingleton<BuzzWireSharedPref>(
      () => BuzzWireSharedPref(preferences: pref));
  injector.registerLazySingleton<DioClient>(() => DioClient());
  injector.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  injector.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  injector.registerLazySingleton<SupabaseStorageClient>(
      () => Supabase.instance.client.storage);

  injector.registerLazySingleton<AppThemeManager>(
      () => AppThemeManagerImpl(sharedPref: injector()));
  injector.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  await provideSharedDependencies();
  await provideAuthDependencies();
  await provideNewsDependencies();
  await provideProfileDependencies();
  await provideSearchHistoryDependencies();
  await provideSettingsDependencies();
}

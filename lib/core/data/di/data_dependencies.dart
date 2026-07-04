import 'package:buzzwire/core/data/datasource/auth/auth_local_datasource.dart';
import 'package:buzzwire/core/data/datasource/auth/auth_remote_datasource.dart';
import 'package:buzzwire/core/data/datasource/notification/notification_remote_datasource.dart';
import 'package:buzzwire/core/data/datasource/profile/profle_local_datasource.dart';
import 'package:buzzwire/core/data/datasource/profile/profile_remote_datasource.dart';
import 'package:buzzwire/core/data/manager/app_theme_manager_impl.dart';
import 'package:buzzwire/core/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/core/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/core/data/repository/notification_repository_impl.dart';
import 'package:buzzwire/core/data/repository/profile_repository_impl.dart';
import 'package:buzzwire/core/domain/manager/app_theme_manager.dart';
import 'package:buzzwire/core/domain/manager/local_user_manager.dart';
import 'package:buzzwire/core/domain/repository/auth_repository.dart';
import 'package:buzzwire/core/domain/repository/notification_repository.dart';
import 'package:buzzwire/core/domain/repository/profile_repository.dart';
import '../../../injector.dart';

Future<void> provideDataDependencies() async {
  injector.registerLazySingleton<AppThemeManager>(
      () => AppThemeManagerImpl(sharedPref: injector()));
  injector.registerLazySingleton<LocalUserManager>(
      () => LocalUserManagerImpl(appPreference: injector()));

  // Auth data layer
  injector.registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(appPreference: injector()));
  injector.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(firebaseAuth: injector()));
  injector.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: injector(), networkConnectionChecker: injector()));

  // Profile data layer
  injector.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl(pref: injector()));
  injector.registerFactory<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firestoreDb: injector(),
      appWriteStorage: injector(),
    ),
  );
  injector.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDatasource: injector(),
      remoteDatasource: injector(),
      networkConnectionChecker: injector(),
    ),
  );

  // Notification data layer
  injector.registerFactory<NotificationRemoteDatasource>(() =>
      NotificationRemoteDatasourceImpl(
          firestore: injector(), messaging: injector()));
  injector.registerFactory<NotificationRepository>(() =>
      NotificationRepositoryImpl(
          remoteDatasource: injector(), networkConnectionChecker: injector()));
}

import 'package:buzzwire/core/utils/local_storage/shared_preference_util.dart';
import 'package:buzzwire/src/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:buzzwire/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:buzzwire/src/features/auth/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/read_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/save_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/verify_email_usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> provideAuthDependencies() async {
  injector.registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(appPreference: injector()));
  injector.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(firebaseAuth: injector()));

  // Repository
  injector.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: injector()));

  injector.registerFactory<LocalUserManager>(
      () => LocalUserManagerImpl(appPreference: injector()));

  // usecases
  injector.registerFactory<ReadEntry>(() => ReadEntry(userManager: injector()));
  injector.registerFactory<SaveEntry>(() => SaveEntry(userManager: injector()));
  injector.registerFactory<ResetPassword>(
      () => ResetPassword(authRepo: injector()));
  injector.registerFactory<SendVerificationEmail>(
      () => SendVerificationEmail(authRepo: injector()));

  injector.registerFactory<SignIn>(() => SignIn(authRepo: injector()));

  injector.registerFactory<SignOut>(() => SignOut(authRepo: injector()));

  injector.registerFactory<SignUp>(() => SignUp(authRepo: injector()));

  injector
      .registerFactory<VerifyEmail>(() => VerifyEmail(authRepo: injector()));
}

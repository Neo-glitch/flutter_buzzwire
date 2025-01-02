import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:buzzwire/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:buzzwire/src/features/auth/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
import 'package:buzzwire/src/features/auth/domain/repository/auth_repository.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/create_user_account_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/delete_user_account_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/fetch_and_cache_user_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/read_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reauthenticate_user_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/save_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';

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
  injector.registerFactory<ReadEntryUseCase>(
      () => ReadEntryUseCase(userManager: injector()));
  injector.registerFactory<SaveEntryUseCase>(
      () => SaveEntryUseCase(userManager: injector()));
  injector.registerFactory<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(authRepo: injector()));
  injector.registerFactory<SendVerificationEmailUseCase>(
      () => SendVerificationEmailUseCase(authRepo: injector()));

  injector.registerFactory<SignInUseCase>(
      () => SignInUseCase(authRepo: injector()));

  injector.registerFactory<SignOutUseCase>(
    () => SignOutUseCase(
      authRepo: injector(),
      profileRepo: injector(),
    ),
  );

  injector.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(authRepo: injector()));

  injector.registerFactory<CheckEmailVerificationStatusUseCase>(
      () => CheckEmailVerificationStatusUseCase(authRepo: injector()));

  injector.registerFactory<CreateUserAccountUseCase>(
      () => CreateUserAccountUseCase(profileRepo: injector()));

  injector.registerFactory<FetchAndCacheUserUseCase>(
      () => FetchAndCacheUserUseCase(profileRepo: injector()));

  injector.registerFactory<ReAuthenticateUserUseCase>(
      () => ReAuthenticateUserUseCase(authRepo: injector()));

  injector.registerFactory<DeleteUserAccountUseCase>(
    () => DeleteUserAccountUseCase(
      authRepo: injector(),
      profileRepo: injector(),
      reAuthenticateUser: injector(),
    ),
  );
}

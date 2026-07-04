import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/auth/data/manager/local_user_manager_impl.dart';
import 'package:buzzwire/src/features/auth/domain/manager/local_user_manager.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/create_user_account_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/fetch_and_cache_user_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/read_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/save_entry_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart';

Future<void> provideAuthDependencies() async {
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

  injector.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(authRepo: injector()));

  injector.registerFactory<CheckEmailVerificationStatusUseCase>(
      () => CheckEmailVerificationStatusUseCase(authRepo: injector()));

  injector.registerFactory<CreateUserAccountUseCase>(
      () => CreateUserAccountUseCase(profileRepo: injector()));

  injector.registerFactory<FetchAndCacheUserUseCase>(
      () => FetchAndCacheUserUseCase(profileRepo: injector()));
}

import 'package:buzzwire/core/domain/usecase/change_password_usecase.dart';
import 'package:buzzwire/core/domain/usecase/delete_device_token_usecase.dart';
import 'package:buzzwire/core/domain/usecase/delete_user_account_usecase.dart';
import 'package:buzzwire/core/domain/usecase/get_topics_usecase.dart';
import 'package:buzzwire/core/domain/usecase/reauthenticate_user_usecase.dart';
import 'package:buzzwire/core/domain/usecase/save_device_token_usecase.dart';
import 'package:buzzwire/core/domain/usecase/signout_usecase.dart';
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_stream_usecase.dart';
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_usecase.dart';
import 'package:buzzwire/core/domain/usecase/save_app_theme_mode_usecase.dart';
import 'package:buzzwire/core/domain/usecase/subscribe_to_topic_usecase.dart';
import 'package:buzzwire/core/domain/usecase/unsubscribe_from_topic_usecase.dart';
import 'package:buzzwire/injector.dart';

Future<void> provideDomainDependencies() async {
  injector.registerFactory<GetAppThemeModeStream>(
      () => GetAppThemeModeStream(themeManager: injector()));
  injector.registerFactory<GetAppThemeMode>(
      () => GetAppThemeMode(themeManager: injector()));
  injector.registerFactory<SaveAppTheme>(
      () => SaveAppTheme(themeManager: injector()));

  // Cross-feature auth use cases
  injector.registerFactory<ReAuthenticateUserUseCase>(
      () => ReAuthenticateUserUseCase(authRepo: injector()));
  injector.registerFactory<SignOutUseCase>(
    () => SignOutUseCase(
      authRepo: injector(),
      profileRepo: injector(),
      notificationRepo: injector(),
    ),
  );
  injector.registerFactory<DeleteUserAccountUseCase>(
    () => DeleteUserAccountUseCase(
      authRepo: injector(),
      profileRepo: injector(),
      notificationRepo: injector(),
      reAuthenticateUser: injector(),
    ),
  );
  injector.registerFactory<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(
      authRepo: injector(),
      reAuthenticateUser: injector(),
    ),
  );

  // Cross-feature notification use cases
  injector.registerFactory<DeleteDeviceTokenUsecase>(
    () => DeleteDeviceTokenUsecase(notificationRepo: injector()),
  );
  injector.registerFactory<SaveDeviceTokenUsecase>(
    () => SaveDeviceTokenUsecase(notificationRepo: injector()),
  );
  injector.registerFactory<GetTopicsUsecase>(
    () => GetTopicsUsecase(notificationRepo: injector()),
  );
  injector.registerFactory<SubscribeToTopicUsecase>(
    () => SubscribeToTopicUsecase(notificationRepo: injector()),
  );
  injector.registerFactory<UnsubscribeFromTopicUsecase>(
    () => UnsubscribeFromTopicUsecase(notificationRepo: injector()),
  );
}

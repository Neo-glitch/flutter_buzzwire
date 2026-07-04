// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i317;
import 'package:buzzwire/core/cache/buzzwire_app_cache.dart' as _i960;
import 'package:buzzwire/core/cache/buzzwire_app_cache_impl.dart' as _i840;
import 'package:buzzwire/core/cache/di/cache_module.dart' as _i1050;
import 'package:buzzwire/core/common/di/common_module.dart' as _i870;
import 'package:buzzwire/core/common/utils/network_connection_checker.dart'
    as _i584;
import 'package:buzzwire/core/common/utils/network_connection_checker_impl.dart'
    as _i547;
import 'package:buzzwire/core/common/utils/package_info_helper.dart' as _i652;
import 'package:buzzwire/core/config/di/config_module.dart' as _i466;
import 'package:buzzwire/core/config/firebase_remote_config_helper.dart'
    as _i449;
import 'package:buzzwire/core/data/datasource/auth/auth_remote_datasource.dart'
    as _i423;
import 'package:buzzwire/core/data/datasource/auth/auth_remote_datasource_impl.dart'
    as _i88;
import 'package:buzzwire/core/data/datasource/notification/notification_remote_datasource.dart'
    as _i1030;
import 'package:buzzwire/core/data/datasource/notification/notification_remote_datasource_impl.dart'
    as _i336;
import 'package:buzzwire/core/data/datasource/profile/profile_remote_datasource.dart'
    as _i96;
import 'package:buzzwire/core/data/datasource/profile/profile_remote_datasource_impl.dart'
    as _i619;
import 'package:buzzwire/core/data/datasource/profile/profle_local_datasource.dart'
    as _i388;
import 'package:buzzwire/core/data/datasource/profile/profle_local_datasource_impl.dart'
    as _i320;
import 'package:buzzwire/core/data/manager/app_theme_manager_impl.dart'
    as _i769;
import 'package:buzzwire/core/data/manager/local_user_manager_impl.dart'
    as _i448;
import 'package:buzzwire/core/data/repository/auth_repository_impl.dart'
    as _i370;
import 'package:buzzwire/core/data/repository/notification_repository_impl.dart'
    as _i562;
import 'package:buzzwire/core/data/repository/profile_repository_impl.dart'
    as _i602;
import 'package:buzzwire/core/database/app_database.dart' as _i957;
import 'package:buzzwire/core/database/di/database_module.dart' as _i486;
import 'package:buzzwire/core/domain/manager/app_theme_manager.dart' as _i262;
import 'package:buzzwire/core/domain/manager/local_user_manager.dart' as _i406;
import 'package:buzzwire/core/domain/repository/auth_repository.dart' as _i534;
import 'package:buzzwire/core/domain/repository/notification_repository.dart'
    as _i973;
import 'package:buzzwire/core/domain/repository/profile_repository.dart'
    as _i134;
import 'package:buzzwire/core/domain/usecase/change_password_usecase.dart'
    as _i747;
import 'package:buzzwire/core/domain/usecase/delete_device_token_usecase.dart'
    as _i838;
import 'package:buzzwire/core/domain/usecase/delete_user_account_usecase.dart'
    as _i787;
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_stream_usecase.dart'
    as _i562;
import 'package:buzzwire/core/domain/usecase/get_app_theme_mode_usecase.dart'
    as _i602;
import 'package:buzzwire/core/domain/usecase/get_topics_usecase.dart' as _i257;
import 'package:buzzwire/core/domain/usecase/read_entry_usecase.dart' as _i694;
import 'package:buzzwire/core/domain/usecase/reauthenticate_user_usecase.dart'
    as _i874;
import 'package:buzzwire/core/domain/usecase/save_app_theme_mode_usecase.dart'
    as _i866;
import 'package:buzzwire/core/domain/usecase/save_device_token_usecase.dart'
    as _i436;
import 'package:buzzwire/core/domain/usecase/save_entry_usecase.dart' as _i369;
import 'package:buzzwire/core/domain/usecase/signout_usecase.dart' as _i232;
import 'package:buzzwire/core/domain/usecase/subscribe_to_topic_usecase.dart'
    as _i103;
import 'package:buzzwire/core/domain/usecase/unsubscribe_from_topic_usecase.dart'
    as _i663;
import 'package:buzzwire/core/network/di/network_module.dart' as _i705;
import 'package:buzzwire/core/network/dio/dio_client.dart' as _i327;
import 'package:buzzwire/src/features/auth/domain/usecase/check_email_verification_status_usecases.dart'
    as _i314;
import 'package:buzzwire/src/features/auth/domain/usecase/create_user_account_usecase.dart'
    as _i898;
import 'package:buzzwire/src/features/auth/domain/usecase/fetch_and_cache_user_usecase.dart'
    as _i732;
import 'package:buzzwire/src/features/auth/domain/usecase/reset_password_usecase.dart'
    as _i612;
import 'package:buzzwire/src/features/auth/domain/usecase/send_verification_email_usecase.dart'
    as _i387;
import 'package:buzzwire/src/features/auth/domain/usecase/signin_usecase.dart'
    as _i258;
import 'package:buzzwire/src/features/auth/domain/usecase/signup_usecase.dart'
    as _i373;
import 'package:buzzwire/src/features/news/data/datasources/local/news_local_datasource.dart'
    as _i370;
import 'package:buzzwire/src/features/news/data/datasources/local/news_local_datasource_impl.dart'
    as _i77;
import 'package:buzzwire/src/features/news/data/datasources/remote/api/news_api_service.dart'
    as _i776;
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource.dart'
    as _i969;
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource_impl.dart'
    as _i41;
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart'
    as _i86;
import 'package:buzzwire/src/features/news/di/news_module.dart' as _i546;
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart'
    as _i1019;
import 'package:buzzwire/src/features/news/domain/usecases/clear_saved_articles_usecase.dart'
    as _i383;
import 'package:buzzwire/src/features/news/domain/usecases/delete_saved_article_usecase.dart'
    as _i632;
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_by_category_usecase.dart'
    as _i584;
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_usecase.dart'
    as _i1039;
import 'package:buzzwire/src/features/news/domain/usecases/get_news_sources_usecase.dart'
    as _i138;
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart'
    as _i440;
import 'package:buzzwire/src/features/news/domain/usecases/get_paginated_saved_articles_usecase.dart'
    as _i291;
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_count_usecase.dart'
    as _i503;
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart'
    as _i460;
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart'
    as _i306;
import 'package:buzzwire/src/features/notification/di/notification_module.dart'
    as _i637;
import 'package:buzzwire/src/features/profile/domain/usecases/dispose_cache_user_stream_usecase.dart'
    as _i542;
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_stream_usecase.dart'
    as _i492;
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart'
    as _i977;
import 'package:buzzwire/src/features/profile/domain/usecases/get_remote_or_local_user_usecase.dart'
    as _i110;
import 'package:buzzwire/src/features/profile/domain/usecases/update_user_usecase.dart'
    as _i288;
import 'package:buzzwire/src/features/profile/domain/usecases/upload_profile_image_usecase.dart'
    as _i207;
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource.dart'
    as _i645;
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource_impl.dart'
    as _i802;
import 'package:buzzwire/src/features/search_history/data/repository/search_history_repository_impl.dart'
    as _i257;
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart'
    as _i32;
import 'package:buzzwire/src/features/search_history/domain/usecase/clear_search_history_usecase.dart'
    as _i1040;
import 'package:buzzwire/src/features/search_history/domain/usecase/delete_search_history_usecase.dart'
    as _i278;
import 'package:buzzwire/src/features/search_history/domain/usecase/get_search_history_usecase.dart'
    as _i634;
import 'package:buzzwire/src/features/search_history/domain/usecase/save_search_history_usecase.dart'
    as _i958;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final cacheModule = _$CacheModule();
    final configModule = _$ConfigModule();
    final networkModule = _$NetworkModule();
    final commonModule = _$CommonModule();
    final notificationModule = _$NotificationModule();
    final newsModule = _$NewsModule();
    await gh.lazySingletonAsync<_i957.AppDatabase>(
      () => databaseModule.appDatabase(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => cacheModule.sharedPreferences,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i449.FirebaseRemoteConfigHelper>(
      () => configModule.remoteConfigHelper(),
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => networkModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => networkModule.firebaseFirestore);
    gh.lazySingleton<_i327.DioClient>(() => networkModule.dioClient);
    gh.lazySingleton<_i317.Storage>(() => networkModule.appWriteStorage());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => commonModule.connectionChecker);
    await gh.lazySingletonAsync<_i652.PackageInfoHelper>(
      () => commonModule.packageInfoHelper(),
      preResolve: true,
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => notificationModule.firebaseMessaging);
    gh.lazySingleton<_i96.ProfileRemoteDataSource>(
        () => _i619.ProfileRemoteDataSourceImpl(
              firestoreDb: gh<_i974.FirebaseFirestore>(),
              appWriteStorage: gh<_i317.Storage>(),
            ));
    gh.lazySingleton<_i584.NetworkConnectionChecker>(() =>
        _i547.NetworkConnectionCheckImpl(
            connectionChecker: gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i776.NewsApiService>(
        () => newsModule.newsApiService(gh<_i327.DioClient>()));
    gh.lazySingleton<_i370.NewsLocalDataSource>(
        () => _i77.NewsLocalDataSourceImpl(database: gh<_i957.AppDatabase>()));
    gh.lazySingleton<_i645.SearchHistoryLocalDataSource>(() =>
        _i802.SearchHistoryLocalDataSourceImpl(
            database: gh<_i957.AppDatabase>()));
    gh.lazySingleton<_i32.SearchHistoryRepository>(() =>
        _i257.SearchHistoryRepositoryImpl(
            localDataSource: gh<_i645.SearchHistoryLocalDataSource>()));
    gh.lazySingleton<_i969.NewsRemoteDataSource>(() =>
        _i41.NewsRemoteDataSourceImpl(
            newsApiService: gh<_i776.NewsApiService>()));
    gh.lazySingleton<_i423.AuthRemoteDataSource>(() =>
        _i88.AuthRemoteDataSourceImpl(firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i960.BuzzWireAppCache>(() =>
        _i840.BuzzWireAppCacheImpl(preferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1030.NotificationRemoteDatasource>(
        () => _i336.NotificationRemoteDatasourceImpl(
              messaging: gh<_i892.FirebaseMessaging>(),
              firestore: gh<_i974.FirebaseFirestore>(),
            ));
    gh.factory<_i634.GetSearchHistoryUseCase>(() =>
        _i634.GetSearchHistoryUseCase(
            repository: gh<_i32.SearchHistoryRepository>()));
    gh.factory<_i278.DeleteSearchHistoryUseCase>(() =>
        _i278.DeleteSearchHistoryUseCase(
            repository: gh<_i32.SearchHistoryRepository>()));
    gh.factory<_i1040.ClearSearchHistoryUseCase>(() =>
        _i1040.ClearSearchHistoryUseCase(
            repository: gh<_i32.SearchHistoryRepository>()));
    gh.factory<_i958.SaveSearchHistoryUseCase>(() =>
        _i958.SaveSearchHistoryUseCase(
            repository: gh<_i32.SearchHistoryRepository>()));
    gh.lazySingleton<_i534.AuthRepository>(() => _i370.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i423.AuthRemoteDataSource>(),
          networkConnectionChecker: gh<_i584.NetworkConnectionChecker>(),
        ));
    gh.lazySingleton<_i388.ProfileLocalDataSource>(() =>
        _i320.ProfileLocalDataSourceImpl(pref: gh<_i960.BuzzWireAppCache>()));
    gh.lazySingleton<_i973.NotificationRepository>(
        () => _i562.NotificationRepositoryImpl(
              remoteDatasource: gh<_i1030.NotificationRemoteDatasource>(),
              networkConnectionChecker: gh<_i584.NetworkConnectionChecker>(),
            ));
    gh.lazySingleton<_i406.LocalUserManager>(() => _i448.LocalUserManagerImpl(
        appPreference: gh<_i960.BuzzWireAppCache>()));
    gh.lazySingleton<_i134.ProfileRepository>(() => _i602.ProfileRepositoryImpl(
          remoteDatasource: gh<_i96.ProfileRemoteDataSource>(),
          localDatasource: gh<_i388.ProfileLocalDataSource>(),
          networkConnectionChecker: gh<_i584.NetworkConnectionChecker>(),
        ));
    gh.lazySingleton<_i1019.NewsRepository>(() => _i86.NewsRepositoryImpl(
          remoteDataSource: gh<_i969.NewsRemoteDataSource>(),
          localDataSource: gh<_i370.NewsLocalDataSource>(),
        ));
    gh.lazySingleton<_i262.AppThemeManager>(() =>
        _i769.AppThemeManagerImpl(sharedPref: gh<_i960.BuzzWireAppCache>()));
    gh.factory<_i694.ReadEntryUseCase>(() =>
        _i694.ReadEntryUseCase(userManager: gh<_i406.LocalUserManager>()));
    gh.factory<_i369.SaveEntryUseCase>(() =>
        _i369.SaveEntryUseCase(userManager: gh<_i406.LocalUserManager>()));
    gh.factory<_i874.ReAuthenticateUserUseCase>(() =>
        _i874.ReAuthenticateUserUseCase(authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i373.SignUpUseCase>(
        () => _i373.SignUpUseCase(authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i258.SignInUseCase>(
        () => _i258.SignInUseCase(authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i612.ResetPasswordUseCase>(
        () => _i612.ResetPasswordUseCase(authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i387.SendVerificationEmailUseCase>(() =>
        _i387.SendVerificationEmailUseCase(
            authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i314.CheckEmailVerificationStatusUseCase>(() =>
        _i314.CheckEmailVerificationStatusUseCase(
            authRepo: gh<_i534.AuthRepository>()));
    gh.factory<_i232.SignOutUseCase>(() => _i232.SignOutUseCase(
          authRepo: gh<_i534.AuthRepository>(),
          profileRepo: gh<_i134.ProfileRepository>(),
          notificationRepo: gh<_i973.NotificationRepository>(),
        ));
    gh.factory<_i747.ChangePasswordUseCase>(() => _i747.ChangePasswordUseCase(
          authRepo: gh<_i534.AuthRepository>(),
          reAuthenticateUser: gh<_i874.ReAuthenticateUserUseCase>(),
        ));
    gh.factory<_i663.UnsubscribeFromTopicUsecase>(() =>
        _i663.UnsubscribeFromTopicUsecase(
            notificationRepo: gh<_i973.NotificationRepository>()));
    gh.factory<_i103.SubscribeToTopicUsecase>(() =>
        _i103.SubscribeToTopicUsecase(
            notificationRepo: gh<_i973.NotificationRepository>()));
    gh.factory<_i838.DeleteDeviceTokenUsecase>(() =>
        _i838.DeleteDeviceTokenUsecase(
            notificationRepo: gh<_i973.NotificationRepository>()));
    gh.factory<_i257.GetTopicsUsecase>(() => _i257.GetTopicsUsecase(
        notificationRepo: gh<_i973.NotificationRepository>()));
    gh.factory<_i436.SaveDeviceTokenUsecase>(() => _i436.SaveDeviceTokenUsecase(
        notificationRepo: gh<_i973.NotificationRepository>()));
    gh.factory<_i440.GetNewsUseCase>(
        () => _i440.GetNewsUseCase(repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i291.GetPaginatedSavedArticlesUseCase>(() =>
        _i291.GetPaginatedSavedArticlesUseCase(
            repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i306.SaveArticleUseCase>(() =>
        _i306.SaveArticleUseCase(repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i138.GetNewsSourcesUseCase>(() =>
        _i138.GetNewsSourcesUseCase(repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i460.GetSavedArticlesUseCase>(() =>
        _i460.GetSavedArticlesUseCase(repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i584.GetHeadlinesByCategoryUseCase>(() =>
        _i584.GetHeadlinesByCategoryUseCase(
            repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i503.GetSavedArticlesCountUseCase>(() =>
        _i503.GetSavedArticlesCountUseCase(
            repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i383.ClearSavedArticlesUseCase>(() =>
        _i383.ClearSavedArticlesUseCase(
            repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i1039.GetHeadlinesUseCase>(() =>
        _i1039.GetHeadlinesUseCase(repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i632.DeleteSavedArticleUseCase>(() =>
        _i632.DeleteSavedArticleUseCase(
            repository: gh<_i1019.NewsRepository>()));
    gh.factory<_i866.SaveAppTheme>(
        () => _i866.SaveAppTheme(themeManager: gh<_i262.AppThemeManager>()));
    gh.factory<_i602.GetAppThemeMode>(
        () => _i602.GetAppThemeMode(themeManager: gh<_i262.AppThemeManager>()));
    gh.factory<_i562.GetAppThemeModeStream>(() =>
        _i562.GetAppThemeModeStream(themeManager: gh<_i262.AppThemeManager>()));
    gh.factory<_i898.CreateUserAccountUseCase>(() =>
        _i898.CreateUserAccountUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i732.FetchAndCacheUserUseCase>(() =>
        _i732.FetchAndCacheUserUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i542.DisposeCachedUserStreamUseCase>(() =>
        _i542.DisposeCachedUserStreamUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i492.GetCachedUserStreamUseCase>(() =>
        _i492.GetCachedUserStreamUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i288.UpdateUserUseCase>(() =>
        _i288.UpdateUserUseCase(profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i207.UploadProfileImageUseCase>(() =>
        _i207.UploadProfileImageUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i977.GetCachedUserUseCase>(() =>
        _i977.GetCachedUserUseCase(profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i110.GetRemoteOrLocalUserUseCase>(() =>
        _i110.GetRemoteOrLocalUserUseCase(
            profileRepo: gh<_i134.ProfileRepository>()));
    gh.factory<_i787.DeleteUserAccountUseCase>(
        () => _i787.DeleteUserAccountUseCase(
              authRepo: gh<_i534.AuthRepository>(),
              profileRepo: gh<_i134.ProfileRepository>(),
              reAuthenticateUser: gh<_i874.ReAuthenticateUserUseCase>(),
              notificationRepo: gh<_i973.NotificationRepository>(),
            ));
    return this;
  }
}

class _$DatabaseModule extends _i486.DatabaseModule {}

class _$CacheModule extends _i1050.CacheModule {}

class _$ConfigModule extends _i466.ConfigModule {}

class _$NetworkModule extends _i705.NetworkModule {}

class _$CommonModule extends _i870.CommonModule {}

class _$NotificationModule extends _i637.NotificationModule {}

class _$NewsModule extends _i546.NewsModule {}

import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/data/datasources/local/profle_local_datasource.dart';
import 'package:buzzwire/src/features/profile/data/datasources/remote/profile_remote_datasource.dart';
import 'package:buzzwire/src/features/profile/data/repository/profile_repository_impl.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/dispose_cache_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_remote_or_local_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/update_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/upload_profile_image_usecase.dart';

Future<void> provideProfileDependencies() async {
  injector.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl(pref: injector()));

  injector.registerFactory<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firestoreDb: injector(),
      supabaseStorage: injector(),
    ),
  );

  injector.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDatasource: injector(),
      remoteDatasource: injector(),
    ),
  );

  injector.registerFactory<GetCachedUserUseCase>(
    () => GetCachedUserUseCase(profileRepo: injector()),
  );

  injector.registerFactory<GetRemoteOrLocalUserUseCase>(
    () => GetRemoteOrLocalUserUseCase(
      profileRepo: injector(),
    ),
  );

  injector.registerFactory<UpdateUserUseCase>(
    () => UpdateUserUseCase(
      profileRepo: injector(),
    ),
  );

  injector.registerFactory<UploadProfileImageUseCase>(
    () => UploadProfileImageUseCase(
      profileRepo: injector(),
    ),
  );

  injector.registerFactory<GetCachedUserStreamUseCase>(
    () => GetCachedUserStreamUseCase(
      profileRepo: injector(),
    ),
  );

  injector.registerFactory<DisposeCachedUserStreamUseCase>(
    () => DisposeCachedUserStreamUseCase(
      profileRepo: injector(),
    ),
  );
}

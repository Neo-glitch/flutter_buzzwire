import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/dispose_cache_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late GetCachedUserStreamUseCase _getCachedUserStream;
  late DisposeCachedUserStreamUseCase _disposeCachedUserStream;
  late GetCachedUserUseCase _getCachedUser;

  @override
  UserEntity? build() {
    _getCachedUserStream = injector();
    _disposeCachedUserStream = injector();
    _getCachedUser = injector();
    final user = _getCachedUser(NoParams()).getOrElse((l) => null);

    _getCachedUserStream(NoParams()).listen((user) {
      state = user.getOrElse((l) => null);
    });

    // to peform cleanup
    ref.onDispose(() {
      _disposeCachedUserStream(NoParams());
    });
    return user;
  }
}

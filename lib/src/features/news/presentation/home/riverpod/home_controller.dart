import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_stream_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late GetCachedUserStreamUseCase _getCachedUserStream;

  late GetCachedUserUseCase _getCachedUser;

  @override
  UserEntity? build() {
    _getCachedUserStream = injector();
    _getCachedUser = injector();

    observeUserStream();
    final user = _getCachedUser(NoParams()).getOrElse((l) => null);
    return user;
  }

  void observeUserStream() {
    _getCachedUserStream(NoParams()).listen((user) {
      state = user.getOrElse((l) => null);
    });
  }
}

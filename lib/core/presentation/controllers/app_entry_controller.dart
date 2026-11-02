import 'package:buzzwire/core/domain/usecase/read_entry_usecase.dart';
import 'package:buzzwire/core/domain/usecase/save_entry_usecase.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_entry_controller.g.dart';

@Riverpod(keepAlive: true)
class AppEntryController extends _$AppEntryController {
  late ReadEntryUseCase _readEntry;
  late SaveEntryUseCase _saveEntry;

  @override
  Future<bool> build() async {
    _readEntry = injector();
    _saveEntry = injector();
    final result = await _readEntry(NoParams());
    return result.fold(
      (failure) => false,
      (result) => result,
    );
  }

  void saveAppEntry() async {
    final result = await _saveEntry(NoParams());
    result.fold(
      (failure) {},
      (result) {
        state = AsyncData(result);
      },
    );
  }
}

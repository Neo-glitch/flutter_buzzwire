import 'package:buzzwire/injector.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../domain/usecase/read_entry_usecase.dart';
import '../../domain/usecase/save_entry_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_entry_controller.g.dart';

@riverpod
class AppEntryController extends _$AppEntryController {
  late ReadEntryUseCase _readEntry;
  late SaveEntryUseCase _saveEntry;

  @override
  bool build() {
    _readEntry = injector();
    _saveEntry = injector();

    return _readEntry(NoParams()).fold(
      (failure) => false,
      (result) => result,
    );
  }

  void saveAppEntry() async {
    final result = await _saveEntry(NoParams());
    result.fold(
      (failure) {},
      (result) {
        state = result;
      },
    );
  }
}

import 'package:buzzwire/src/features/profile/presentation/riverpod/edit_profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  @override
  EditProfileState build() {
    return const EditProfileState();
  }
}

import 'dart:io';

import 'package:buzzwire/core/ui/strings.dart';
import 'package:buzzwire/core/domain/usecase/usecase.dart';
import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/get_cached_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/update_user_usecase.dart';
import 'package:buzzwire/src/features/profile/domain/usecases/upload_profile_image_usecase.dart';
import 'package:buzzwire/src/features/profile/presentation/riverpod/edit_profile_state.dart';
import 'package:buzzwire/core/domain/entity/country_entity.dart';
import 'package:buzzwire/core/domain/entity/profile_image_entity.dart';
import 'package:buzzwire/core/domain/entity/user_entity.dart';
import 'package:buzzwire/core/ui/model/load_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  late UploadProfileImageUseCase _uploadProfileImageUseCase;
  late UpdateUserUseCase _updateUserUseCase;
  late GetCachedUserUseCase _getCachedUserUseCase;

  @override
  EditProfileState build() {
    _uploadProfileImageUseCase = injector();
    _updateUserUseCase = injector();
    _getCachedUserUseCase = injector();
    final user = _getCachedUserUseCase(NoParams()).getOrElse((l) => null);
    return EditProfileState(user: user);
  }

  void setImage(File image) {
    state = state.copyWith(newImage: image);
  }

  void checkIfUserNameChanged(String userName) {
    final String? currentUserName = state.user?.userName;
    final canResubmitUserName = userName != currentUserName;
    state = state.copyWith(
      canResubmitUsername: canResubmitUserName,
    );
  }

  void checkIfPhoneNumberChanged(String phoneNumber) {
    final canResubmitPhone = phoneNumber != state.user?.phoneNumber;
    state = state.copyWith(canResubmitPhone: canResubmitPhone);
  }

  void setCountry(CountryEntity country) {
    final canResubmitCountry = country.name != state.user?.country.name;
    state = state.copyWith(
        canResubmitCountry: canResubmitCountry, newCountry: country);
  }

  Future<void> updateUserProfile(String userName, String phone) async {
    final user = state.user!;
    state = state.copyWith(loadState: const Loading());

    _updateUserFields(user, userName, phone);

    if (state.newImage != null) {
      final profileImageUrl = await _uploadProfileImage(user, state.newImage!);
      if (profileImageUrl == null) {
        _setErrorState(BuzzWireStrings.unknownError);
        return;
      }
      user.profileImage = profileImageUrl;
    }

    final updateProfileResult = await _updateUserUseCase(user);
    updateProfileResult.fold(
      (_) => _setErrorState(BuzzWireStrings.unknownError),
      (_) => state = state.copyWith(loadState: const Loaded()),
    );
  }

  void _updateUserFields(UserEntity user, String userName, String phone) {
    if (userName.isNotEmpty) user.userName = userName;
    if (phone.isNotEmpty) user.phoneNumber = phone;
    if (state.newCountry != null) user.country = state.newCountry!;
  }

  Future<ProfileImageEntity?> _uploadProfileImage(
      UserEntity user, File image) async {
    final profileImageUrlResult = await _uploadProfileImageUseCase(
      UploadProfileImageParams(user: user, image: image),
    );
    return profileImageUrlResult.fold((_) => null, (imageUrl) => imageUrl);
  }

  void _setErrorState(String errorMessage) {
    state = state.copyWith(loadState: Error(message: errorMessage));
  }
}

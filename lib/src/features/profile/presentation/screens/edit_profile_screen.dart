import 'dart:io';

import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/src/features/profile/presentation/riverpod/edit_profile_controller.dart';
import 'package:buzzwire/src/features/profile/presentation/riverpod/edit_profile_state.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/select_image_source_bottomsheet.dart';
import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_circular_image.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_country_picker.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_email_input_field.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/form_input_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    Future.microtask(() {
      final uiState = ref.read(editProfileControllerProvider);
      final user = uiState.user;

      _emailController.text = user?.email.orEmpty ?? '';
      _userNameController.text = user?.userName.orEmpty ?? '';
      _phoneNumberController.text = user?.phoneNumber.orEmpty ?? '';
      _countryController.text = user?.country.name ?? '';
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _countryController.dispose();
    _userNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _listenToUiState() {
    ref.listen<EditProfileState>(editProfileControllerProvider,
        (previous, next) async {
      if (next.loadState is Error && previous?.loadState is! Error) {
        final message = (next.loadState as Error).message;
        context.showSingleButtonAlert(BuzzWireStrings.error, message,
            buttonText: BuzzWireStrings.retry);
      } else if (next.loadState is Loaded) {
        await context.showSingleButtonAlert(
            "Success", "Profile updated successfully");
        if (mounted) context.pop();
      }
    });
  }

  void _showSelectImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      builder: (ctx) =>
          SelectImageSourceBottomSheet(onItemClick: _pickImageFromSource),
    );
  }

  void _pickImageFromSource(ImageSource source) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
    );

    if (image != null) {
      ref
          .read(editProfileControllerProvider.notifier)
          .setImage(File(image.path));
    }
  }

  void _onSavePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(editProfileControllerProvider.notifier).updateUserProfile(
            _userNameController.text,
            _phoneNumberController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(editProfileControllerProvider);
    _listenToUiState();

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileImage(uiState),
                      const Gap(30),
                      ..._buildInputSection(uiState),
                    ],
                  ),
                ),
              ),
              _buildBottomFrame(uiState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomFrame(EditProfileState uiState) {
    final isButtonEnabled = _userNameController.text.isNotEmpty &&
        (uiState.canResubmitCountry ||
            uiState.canResubmitPhone ||
            uiState.canResubmitUsername ||
            uiState.newImage != null);

    return BuzzWireBottomFrame(
      child: BuzzWireProgressButton(
        isDisabled: !isButtonEnabled,
        text: const Text("Save"),
        isLoading: uiState.loadState is Loading,
        onPressed: _onSavePressed,
      ),
    );
  }

  List<Widget> _buildInputSection(EditProfileState uiState) {
    return [
      _buildEmailInputSection(uiState),
      const Gap(20),
      _buildUsernameInputSection(uiState),
      const Gap(20),
      _buildPhoneInputSection(uiState),
      const Gap(20),
      _buildCountryInputSection(uiState),
    ];
  }

  Widget _buildProfileImage(EditProfileState uiState) {
    return Center(
      child: Stack(
        children: [
          BuzzWireCircularImage(
            radius: 60,
            borderColor: context.primaryColor.withOpacity(0.7),
            borderWidth: 2,
            imageUrl: uiState.newImage == null
                ? uiState.user?.profileImage?.imageUrl.orEmpty
                : null,
            imagePath: uiState.newImage?.path,
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: InkWell(
              onTap: _showSelectImageSourceBottomSheet,
              borderRadius: BorderRadius.circular(16),
              child: const CircleAvatar(
                radius: 16,
                child: FaIcon(FontAwesomeIcons.camera, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInputSection(EditProfileState uiState) {
    return FormInputGroup(
      headerTitle: "Email",
      isRequiredInput: true,
      child: BuzzWireEmailInputField(
        controller: _emailController,
        enabled: false,
      ),
    );
  }

  Widget _buildUsernameInputSection(EditProfileState uiState) {
    return FormInputGroup(
      headerTitle: "Username",
      isRequiredInput: true,
      child: TextField(
        enabled: uiState.loadState is! Loading,
        focusNode: _userNameFocusNode,
        controller: _userNameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_phoneNumberFocusNode),
        onChanged: (value) => ref
            .read(editProfileControllerProvider.notifier)
            .checkIfUserNameChanged(value),
      ),
    );
  }

  Widget _buildPhoneInputSection(EditProfileState uiState) {
    return FormInputGroup(
      headerTitle: "Phone",
      child: TextField(
        enabled: uiState.loadState is! Loading,
        focusNode: _phoneNumberFocusNode,
        keyboardType: TextInputType.phone,
        controller: _phoneNumberController,
        textInputAction: TextInputAction.done,
        onChanged: (value) => ref
            .read(editProfileControllerProvider.notifier)
            .checkIfPhoneNumberChanged(value),
      ),
    );
  }

  Widget _buildCountryInputSection(EditProfileState uiState) {
    return FormInputGroup(
      headerTitle: "Country",
      isRequiredInput: true,
      child: BuzzWireCountryPicker(
        isEnabled: uiState.loadState is! Loading,
        onSelected: (country) {
          final countryEntity = CountryEntity(
            name: country.name,
            code: country.countryCode,
          );
          ref
              .read(editProfileControllerProvider.notifier)
              .setCountry(countryEntity);
        },
        countryController: _countryController,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        "Profile",
        style: context.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }
}

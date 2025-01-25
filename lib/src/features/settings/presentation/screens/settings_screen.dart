import 'package:buzzwire/core/constants/app_constants.dart';
import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/settings_tile.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/settings_controller.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/app_theme_bottomsheet.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/screens/operation_loading_dialog.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _showAppThemeBottomSheet() {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      builder: (ctx) {
        return const AppThemeBottomSheet();
      },
    );
  }

  void _showConfirmSignoutConfirmationDialog() {
    context.showDoubleButtonAlert(
      BuzzWireStrings.signOut,
      BuzzWireStrings.signOutDialogDesc,
      BuzzWireStrings.cancel,
      BuzzWireStrings.yes,
      onSecondaryButtonClick: () {
        ref.read(settingsControllerProvider.notifier).signOut();
      },
    );
  }

  void _showLoadingDialog() {
    context.showFullScreenDialog(
        dialog: const OperationLoadingDialog(
      title: BuzzWireStrings.signingOut,
    ));
  }

  void _launchEmail() async {
    final wasLaunched = await launchUrl(
      Uri.parse(
          "mailto:${BuzzWireAppConstants.devEmail}?subject=Feedback for BuzzWire"),
    );
    if (!wasLaunched) {
      if (mounted) context.showToast("Failed to lauch email app!");
    }
  }

  void _showComingSoonDialog() {
    context.showSingleButtonAlert(
        "Coming soon!", "This feature isn't available at the moment",
        buttonText: "Ok");
  }

  void _listenToUiState() {
    ref.listen(
      settingsControllerProvider,
      (previous, next) async {
        if (next.loadState is Error && previous?.loadState is! Error) {
          // pop loading dialog off
          context.pop();
          final message = (next.loadState as Error).message;
          context.showSingleButtonAlert(BuzzWireStrings.error, message);
        }
        if (next.loadState is Loading) {
          _showLoadingDialog();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _listenToUiState();
    return Scaffold(
      appBar: BuzzWireAppBar(
        title: Text(
          BuzzWireStrings.settings,
          style: context.titleLarge?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: false,
      children: [
        _buildSectionHeader(BuzzWireStrings.account),
        const Gap(8),
        _buildProfileSettingsSection(),
        const Gap(24),
        _buildSectionHeader(BuzzWireStrings.appPreferences),
        const Gap(8),
        _buildAppPreferencesSettingsSection(),
        const Gap(24),
        _buildSectionHeader(BuzzWireStrings.general),
        const Gap(8),
        _buildGeneralSettingsSection(),
      ],
    );
  }

  Widget _buildProfileSettingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Card(
        child: Column(
          children: [
            SettingsTile(
              title: BuzzWireStrings.profile,
              onClick: () => context.pushNamed(BuzzWireRoute.editProfile.name),
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.myArticles,
              onClick: _showComingSoonDialog,
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.changePassword,
              onClick: () =>
                  context.pushNamed(BuzzWireRoute.changePassword.name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppPreferencesSettingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Card(
        child: Column(
          children: [
            SettingsTile(
              title: BuzzWireStrings.theme,
              onClick: () {
                _showAppThemeBottomSheet();
              },
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.interests,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralSettingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Card(
        child: Column(
          children: [
            SettingsTile(
              title: BuzzWireStrings.sendFeedback,
              onClick: _launchEmail,
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.signOut,
              onClick: _showConfirmSignoutConfirmationDialog,
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.deleteAccount,
              onClick: () => context.pushNamed(
                BuzzWireRoute.deleteAccount.name,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        title,
        style: context.bodyMedium?.copyWith(
          color: BuzzWireColors.darkGrey,
        ),
      ),
    );
  }
}

import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/settings_tile.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/settings_controller.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/app_theme_dialog.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _showAppThemeDialog() {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      builder: (ctx) {
        return const AppThemeDialog();
      },
    );
  }

  void _showConfirmSignoutDialog() {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: BuzzWireAppBar(
        title: Text(
          BuzzWireStrings.settings,
          style: context.titleLarge?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _buildBody(),
      ),
    ));
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
              onClick: () {
                context.pushNamed(BuzzWireRoute.editProfile.name);
              },
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.myArticles,
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.changePassword,
              onClick: () {},
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
              title: BuzzWireStrings.language,
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.theme,
              onClick: () {
                _showAppThemeDialog();
              },
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.countryAndRegion,
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.notifications,
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
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.signOut,
              onClick: _showConfirmSignoutDialog,
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: BuzzWireStrings.deleteAccount,
              onClick: () {},
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

import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/settings_tile.dart';
import 'package:buzzwire/src/features/settings/presentation/screens/app_theme_dialog.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BuzzWireAppBar(
          title: Text(
            "Settings",
            style: context.titleLarge?.copyWith(
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
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
        _buildSectionHeader("Account"),
        const Gap(8),
        _buildProfileSettingsSection(),
        const Gap(24),
        _buildSectionHeader("App Preferences"),
        const Gap(8),
        _buildAppPreferencesSettingsSection(),
        const Gap(24),
        _buildSectionHeader("General"),
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
              title: "Profile",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "My Articles",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Change Password",
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
              title: "Language",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Theme",
              onClick: () {
                _showAppThemeDialog();
              },
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Country & region",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Notifications",
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
              title: "Send Feedback",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Log out",
              onClick: () {},
            ),
            const BuzzWireDivider(),
            SettingsTile(
              title: "Delete Account",
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

  void _showAppThemeDialog() {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      builder: (ctx) {
        return const AppThemeDialog();
      },
    );
  }
}

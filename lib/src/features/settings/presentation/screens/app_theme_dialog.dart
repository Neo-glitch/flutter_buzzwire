import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/theme_controller.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottomsheet_drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AppThemeDialog extends ConsumerStatefulWidget {
  const AppThemeDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppThemeDialogState();
}

class _AppThemeDialogState extends ConsumerState<AppThemeDialog> {
  late int _selectedIndex;

  final Map<String, ThemeMode> _optionsThemeModeMap = {
    "Light Mode": ThemeMode.light,
    "Dark Mode": ThemeMode.dark,
    "System Default": ThemeMode.system
  };

  List<String> get _options => _optionsThemeModeMap.keys.toList();

  @override
  void initState() {
    super.initState();
    _getSelectedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuzzWireBottomSheetDragHandle(
            onClose: () => context.pop(),
          ),
          Text("Theme", style: context.titleMedium),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _buildThemeOptionsList(),
            ),
          )
        ],
      ),
    );
  }

  ListView _buildThemeOptionsList() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        final option = _options[idx];
        return _buildItem(
          title: option,
          isSelected: _selectedIndex == idx,
          onCLick: (value) async {
            if (value == true && _selectedIndex != idx) {
              final themeMode = _optionsThemeModeMap[option]!;
              await ref
                  .read(themeControllerProvider.notifier)
                  .setAppTheme(themeMode);
              setState(() {
                _selectedIndex = idx;
              });
            }
          },
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: _options.length,
    );
  }

  Widget _buildItem({
    required String title,
    required bool isSelected,
    required Function(bool? value) onCLick,
  }) {
    final borderColor =
        isSelected ? context.primaryColor : context.surfaceColor;
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: CheckboxListTile(
        activeColor: context.primaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        side: const BorderSide(color: BuzzWireColors.darkGrey, width: 1.8),
        checkboxShape: const OvalBorder(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        splashRadius: 18,
        title: Text(
          title,
          style: context.bodyMedium,
        ),
        value: isSelected,
        onChanged: onCLick,
      ),
    );
  }

  void _getSelectedIndex() {
    final currentThemeMode =
        ref.read(themeControllerProvider.notifier).getCurrentTheme();
    final key = _optionsThemeModeMap.entries
        .firstWhere(
          (entry) => entry.value == currentThemeMode,
        )
        .key;

    _selectedIndex = _options.indexOf(key);
  }
}

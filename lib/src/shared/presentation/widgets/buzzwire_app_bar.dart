import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuzzWireAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final void Function()? onBackPressed;
  const BuzzWireAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = GoRouter.of(context).routerDelegate.canPop();
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: true,
      leading: canPop
          ? IconButton(
              onPressed: () =>
                  onBackPressed != null ? onBackPressed!() : context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 24,
              ),
            )
          : null,
      leadingWidth: 35,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

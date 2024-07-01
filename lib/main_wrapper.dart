import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

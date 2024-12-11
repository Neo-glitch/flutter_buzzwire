import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/news/presentation/categories.dart';
import 'package:buzzwire/src/features/news/presentation/screens/home_tab_screens/entertainment_news_screen.dart';
import 'package:buzzwire/src/features/news/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [_buildAppBar(context, innerBoxIsScrolled)];
            },
            body: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, bool innerBoxScrolled) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      forceElevated: innerBoxScrolled,
      flexibleSpace: const FlexibleSpaceBar(background: HomeAppBar()),
      bottom: _buildTabBar(context),
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: context.onBackgroundColor,
      labelStyle: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          context.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
      tabAlignment: TabAlignment.start,
      controller: _tabController,
      isScrollable: true,
      indicatorWeight: 0.1,
      dividerHeight: 0.3,
      dividerColor: BuzzWireColors.darkGrey,
      tabs: _buildTabItems(),
    );
  }

  List<Widget> _buildTabItems() {
    return List.generate(
      categories.length,
      (index) => Tab(
        text: categories[index],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: List.generate(
        categories.length,
        (index) => _buildTabContent(categories[index]),
      ),
    );
  }

  Widget _buildTabContent(String key) {
    return NewsScreen(key);
  }
}

import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/navigation/route.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/preferred_topics_setup_controller.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/riverpod/preferred_topics_setup_state.dart';
import 'package:buzzwire/src/features/auth/presentation/signup/widgets/topic_card.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PreferredTopicsSetupScreen extends ConsumerStatefulWidget {
  const PreferredTopicsSetupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TopicsFollowingSetupScreenState();
}

class _TopicsFollowingSetupScreenState
    extends ConsumerState<PreferredTopicsSetupScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _getTopics());
  }

  void _onTopicClick(TopicEntity topic) {
    ref
        .read(preferredTopicsSetupControllerProvider.notifier)
        .toggleTopicSelection(topic);
  }

  void _getTopics() {
    ref.read(preferredTopicsSetupControllerProvider.notifier).getTopics();
  }

  void _navigateToSignUpPage(List<TopicEntity> selectedTopics) {
    context.pushNamed(BuzzWireRoute.signUp.name, extra: selectedTopics);
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(preferredTopicsSetupControllerProvider);
    return Scaffold(
      appBar: const BuzzWireAppBar(),
      body: _buildBody(uiState),
    );
  }

  Widget _buildBody(PreferredTopicsSetupState uiState) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContent(uiState)),
                  _buildBottomFrame(uiState),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent(PreferredTopicsSetupState uiState) {
    if (uiState.loadState is Loading) {
      return const BuzzWireProgressLoader();
    }

    if (uiState.loadState is Error && uiState.topics.isEmpty) {
      final message = (uiState.loadState as Error).message;
      return _buildErrorScreen(message);
    }

    if (uiState.loadState is Loaded && uiState.topics.isEmpty) {
      return _buildEmptyScreen();
    }

    if (uiState.loadState is Loaded) {
      return _buildTopicsList(uiState);
    }

    return const SizedBox.expand();
  }

  BuzzWireEmptyOrErrorScreen _buildEmptyScreen() =>
      BuzzWireEmptyOrErrorScreen.empty(message: ErrorText.unknownError);

  BuzzWireEmptyOrErrorScreen _buildErrorScreen(String message) {
    return BuzzWireEmptyOrErrorScreen.error(
      message: message,
      onPressed: _getTopics,
    );
  }

  Widget _buildTopicsList(PreferredTopicsSetupState uiState) {
    final topics = uiState.topics;
    final selectedTopics = uiState.selectedTopics;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: uiState.topics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisExtent: 250,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (ctx, idx) {
        final topic = topics[idx];
        final isSelected = selectedTopics.contains(topic);
        return TopicCard(
          topic: topic,
          isSelected: isSelected,
          onClick: _onTopicClick,
        );
      },
    );
  }

  Widget _buildBottomFrame(PreferredTopicsSetupState uiState) {
    final isEnabled = uiState.selectedTopics.length > 1;
    return BuzzWireBottomFrame(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isEnabled
              ? () => _navigateToSignUpPage(uiState.selectedTopics)
              : null,
          child: const Text("Continue"),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select your topics of interest",
            style: context.titleLarge,
          ),
          Text(
            "Choose 2 or more",
            style: context.bodySmall?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

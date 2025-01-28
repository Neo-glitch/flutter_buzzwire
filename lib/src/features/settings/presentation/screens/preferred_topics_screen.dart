import 'package:buzzwire/core/constants/strings.dart';
import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/preferred_topics_controller.dart';
import 'package:buzzwire/src/features/settings/presentation/riverpod/preferred_topics_state.dart';
import 'package:buzzwire/src/features/settings/presentation/widgets/topic_card.dart';
import 'package:buzzwire/src/shared/presentation/riverpod/load_state.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_empty_or_error_screen.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PreferredTopicsScreen extends ConsumerStatefulWidget {
  const PreferredTopicsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreferredTopicsScreenState();
}

class _PreferredTopicsScreenState extends ConsumerState<PreferredTopicsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _getTopics());
  }

  void _onTopicClick(TopicEntity topic) {
    ref
        .read(preferredTopicsControllerProvider.notifier)
        .toggleTopicSelection(topic);
  }

  void _getTopics() {
    ref.read(preferredTopicsControllerProvider.notifier).getTopics();
  }

  void _saveTopicsOfInterest() {
    ref
        .read(preferredTopicsControllerProvider.notifier)
        .updateTopicsFollowing();
  }

  void _listenToUiState() {
    ref.listen(
      preferredTopicsControllerProvider,
      (prev, next) async {
        if (next.loadState is Error && prev?.loadState is! Error) {
          final message = (next.loadState as Error).message;
          context.showSingleButtonAlert(BuzzWireStrings.error, message,
              buttonText: BuzzWireStrings.retry);
        } else if (next.loadState is Loaded && next.isUpdateCompleted) {
          await context.showSingleButtonAlert(
            "Interests updated!",
            "Your feed will now reflect your preferences.",
          );
          if (mounted) context.pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _listenToUiState();
    final uiState = ref.watch(preferredTopicsControllerProvider);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buldBody(uiState)),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        "Interests",
        style: context.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buldBody(PreferredTopicsState uiState) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildContent(uiState),
          ),
        ),
        _buildBottomFrame(uiState)
      ],
    );
  }

  Widget _buildContent(PreferredTopicsState uiState) {
    if (uiState.loadState is Loading && uiState.topics.isEmpty) {
      return const BuzzWireProgressLoader();
    }

    if (uiState.loadState is Error && uiState.topics.isEmpty) {
      final message = (uiState.loadState as Error).message;
      return _buildErrorScreen(message);
    }

    if (uiState.loadState is Error && uiState.topics.isEmpty) {
      final message = (uiState.loadState as Error).message;
      return _buildErrorScreen(message);
    }

    if (uiState.loadState is Loaded && uiState.topics.isEmpty) {
      return _buildEmptyScreen();
    }

    // if (uiState.loadState is Loaded ) {
    //   return _buildLoadedContent(uiState);
    // }

    // return const SizedBox.expand();
    return _buildLoadedContent(uiState);
  }

  Widget _buildLoadedContent(PreferredTopicsState uiState) {
    final topics = uiState.topics;
    final selectedTopics = uiState.selectedTopics;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              BuzzWireStrings.chooseTopicsOfInterestDesc,
              style: context.bodySmall?.copyWith(fontSize: 14),
            ),
            const Gap(10),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topics.length,
              itemBuilder: (ctx, idx) {
                final topic = topics[idx];
                final isSelected = selectedTopics.contains(topic);
                return TopicCard(
                  isEnabled: uiState.loadState is! Loading,
                  topic: topic,
                  isSelected: isSelected,
                  onClick: _onTopicClick,
                );
              },
              separatorBuilder: (context, index) => const Gap(10),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyScreen() =>
      BuzzWireEmptyOrErrorScreen.empty(message: ErrorText.unknownError);

  Widget _buildErrorScreen(String message) {
    return BuzzWireEmptyOrErrorScreen.error(
      message: message,
      onPressed: _getTopics,
    );
  }

  Widget _buildBottomFrame(PreferredTopicsState uiState) {
    final isEnabled = uiState.selectedTopics.length > 1;
    return BuzzWireBottomFrame(
      child: SizedBox(
        width: double.infinity,
        child: BuzzWireProgressButton(
          isDisabled: !isEnabled,
          isLoading: uiState.loadState is Loading && uiState.topics.isNotEmpty,
          onPressed: _saveTopicsOfInterest,
          text: const Text(BuzzWireStrings.save),
        ),
      ),
    );
  }
}

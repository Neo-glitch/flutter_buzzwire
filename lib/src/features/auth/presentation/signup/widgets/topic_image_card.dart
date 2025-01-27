import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:flutter/material.dart';

class TopicImageCard extends StatelessWidget {
  final TopicEntity topic;
  final bool isSelected;
  final Function(TopicEntity topic) onClick;

  const TopicImageCard({
    super.key,
    required this.topic,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(topic),
      child: Stack(
        children: [
          _buildImageCard(),
          _buildOverlay(),
          _buildTitle(context),
          if (isSelected) _buildCheckbox(),
          if (isSelected) _buildSelectionOverlay(context),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return BuzzWireImageCard(
      imageUrl: topic.imageUrl,
      height: 250,
      width: double.infinity,
      placeHoldersSize: 100,
      radius: 12,
    );
  }

  Widget _buildOverlay() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Text(
          topic.title,
          textAlign: TextAlign.center,
          style: context.titleSmall?.copyWith(color: BuzzWireColors.white),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Positioned(
      top: 0,
      right: 0,
      child: Checkbox(
        shape: const OvalBorder(),
        value: isSelected,
        onChanged: null,
      ),
    );
  }

  Widget _buildSelectionOverlay(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: context.primaryColor.withOpacity(0.22),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

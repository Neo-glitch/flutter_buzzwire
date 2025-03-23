import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_image_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopicCard extends StatelessWidget {
  final TopicEntity topic;
  final bool isSelected;
  final bool isEnabled;
  final Function(TopicEntity topic) onClick;

  const TopicCard({
    super.key,
    required this.topic,
    required this.isSelected,
    required this.onClick,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? () => onClick(topic) : null,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final borderColor =
        isSelected ? context.primaryColor : context.backgroundColor;
    final backgroundColor = isEnabled
        ? context.surfaceColor
        : context.surfaceColor.withOpacity(0.4);
    final textColor = isEnabled
        ? context.bodyMedium?.color
        : context.bodyMedium?.color?.withOpacity(0.2);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: BuzzWireColors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 0.5, // How far the shadow spreads
            blurRadius: 2, // How blurry the shadow is
            offset: const Offset(0, 1), // Shadow position (x, y)
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: Row(
        children: [
          BuzzWireImageCard(
            width: 100,
            height: 100,
            radius: 10,
            imageUrl: topic.imageUrl,
          ),
          const Gap(10),
          Expanded(
            child: Text(
              topic.title,
              style: context.bodyMedium?.copyWith(
                color: textColor,
              ),
            ),
          ),
          const Spacer(),
          if (isSelected)
            Checkbox(
              shape: const OvalBorder(),
              value: isSelected,
              onChanged: null,
            ),
        ],
      ),
    );
  }
}

import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/features/settings/presentation/model/image_source_option.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottomsheet_drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSourceBottomSheet extends StatelessWidget {
  final Function(ImageSource) onItemClick;
  SelectImageSourceBottomSheet({
    super.key,
    required this.onItemClick,
  });

  final List<ImageSourceOption> _imageSources =
      ImageSourceOption.getImageSources();

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
          Text("Select Image", style: context.titleSmall),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _buildImageSourceOptionsList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageSourceOptionsList() {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        final imageSource = _imageSources[idx];
        return _buildImageSourceItem(
          context: ctx,
          imageSource: imageSource,
          onClick: onItemClick,
        );
      },
      separatorBuilder: (ctx, idx) => const Gap(10),
      itemCount: _imageSources.length,
    );
  }

  Widget _buildImageSourceItem({
    required BuildContext context,
    required ImageSourceOption imageSource,
    required Function(ImageSource) onClick,
  }) {
    return ListTile(
      leading: Icon(imageSource.iconData),
      title: Text(
        imageSource.title,
        style: context.bodyMedium,
      ),
      onTap: () {
        onClick(imageSource.source);
        context.pop();
      },
    );
  }
}

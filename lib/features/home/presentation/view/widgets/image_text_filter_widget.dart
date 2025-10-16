import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/widgets/custom_image_viewer.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class ImageTextFilterWidget extends StatelessWidget {
  const ImageTextFilterWidget({
    super.key,
    required this.text,
    required this.imagePath,
  });

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.appColors.borderColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ImageViewerWidget(
            imagePath: imagePath,
          ),
        ),
        Text(
          text,
          style: context.appTextStyles.font12Regular,
        ),
      ],
    );
  }
}

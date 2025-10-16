import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class TextFilterChipWidget extends StatelessWidget {
  const TextFilterChipWidget({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.appTextStyles;
    final appColors = context.appColors;
    final borderRadius = BorderRadius.circular(4);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appColors.orangeColor.withValues(
            alpha: isSelected ? 0.05 : 0,
          ),
          border: Border.all(
            color: appColors.borderColor,
            width: 1,
          ),
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: isSelected
              ? textStyle.font14MediumOrangeColor
              : textStyle.font14MediumGreyColor,
        ),
      ),
    );
  }
}

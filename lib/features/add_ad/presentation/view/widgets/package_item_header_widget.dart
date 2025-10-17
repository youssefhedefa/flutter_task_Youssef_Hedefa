import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class PackageItemHeaderWidget extends StatelessWidget {
  const PackageItemHeaderWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.price,
  });

  final bool isSelected;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    final appTextStyles = context.appTextStyles;
    final appColors = context.appColors;
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          activeColor: appColors.purpleColor,
          onChanged: (value) {},
        ),
        Text(
          title,
          style: appTextStyles.font16Bold.copyWith(
            color: isSelected ? appColors.purpleColor : appColors.selectedColor,
          ),
        ),
        const Spacer(),
        Text(
          '$price ج.م',
          style: appTextStyles.font16BoldOrangeColor.copyWith(
            decorationColor: appColors.orangeColor,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_svg_builder.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/core/themes/app_colors.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.iconColor,
  });

  final bool isSelected;
  final String iconPath;
  final String label;
  final Function()? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textStyle = context.appTextStyles;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 46.h,
          padding: EdgeInsets.only(top: 4.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: isSelected
                  ? BorderSide(color: appColors.selectedColor, width: 1.2)
                  : BorderSide.none,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgBuilder(
                path: iconPath,
                height: 24,
                width: 24,
                color: getColor(appColors),
              ),
              Text(
                label,
                style: textStyle.font12Medium.copyWith(
                  color: getColor(appColors),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(AppColors appColors) =>
      iconColor ??
      (isSelected ? appColors.selectedColor : appColors.unselectedColor);
}

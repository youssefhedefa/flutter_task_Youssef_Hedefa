import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_svg_builder.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class SelectFilterWidget extends StatelessWidget {
  const SelectFilterWidget({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
    this.onPressed,
    required this.buttonChild,
    required this.iconPath,
    this.iconSize = 24,
  });

  final String label;
  final String iconPath;
  final String title;
  final String subtitle;
  final Function()? onPressed;
  final Widget buttonChild;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final appTextStyles = context.appTextStyles;
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: AppNumConstants.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != '') Column(
            children: [
              Text(
                label,
                style: appTextStyles.font16MediumGreyColor,
              ),
              12.verticalSpace,
            ],
          ),
          Row(
            children: [
              CustomSvgBuilder(
                path: iconPath,
                width: iconSize.w,
                height: iconSize.h,
              ),
              if(iconSize < 24)12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: appTextStyles.font14Medium,
                  ),
                  Text(
                    subtitle,
                    style: appTextStyles.font12RegularGreyColor,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: buttonChild,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

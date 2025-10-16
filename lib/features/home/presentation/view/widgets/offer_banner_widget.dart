import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class OfferBannerWidget extends StatelessWidget {
  const OfferBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
      padding: REdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: appColors.orangeColor.withValues(
          alpha: 0.05,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.done,
            color: appColors.successColor,
            size: 16.r,
          ),
          4.horizontalSpace,
          Text(
            context.freeShipping,
            style: context.appTextStyles.font12RegularSuccessColor,
          ),
          const Spacer(),
          Text(context.offerNow, style: context.appTextStyles.font10Regular),
        ],
      ),
    );
  }
}

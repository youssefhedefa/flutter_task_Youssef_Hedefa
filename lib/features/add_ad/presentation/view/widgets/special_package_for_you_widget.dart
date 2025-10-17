import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class SpecialPackageForYouWidget extends StatelessWidget {
  const SpecialPackageForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextStyles = context.appTextStyles;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(
          alpha: 0.05,
        ),
        border: Border.all(color: context.appColors.borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.customPackages,style: appTextStyles.font14Medium,),
          Text(
            context.contactUsForPackage,
            style: context.appTextStyles.font12Regular,
          ),Text(
            context.salesTeam,
            style: context.appTextStyles.font16Bold.copyWith(
              color: context.appColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

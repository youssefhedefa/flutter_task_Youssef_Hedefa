import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class ExploreOffersWidget extends StatelessWidget {
  const ExploreOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.appTextStyles;
    return Row(
      children: [
        Text(
          context.exploreOffers,
          style: textStyle.font16Medium,
        ),
        const Spacer(),
        Text(
          context.all,
          style: textStyle.font16BoldGreyColor,
        ),
        Icon(
          Icons.arrow_forward,
          color: context.appColors.unselectedColor,
        ),
      ],
    );
  }
}

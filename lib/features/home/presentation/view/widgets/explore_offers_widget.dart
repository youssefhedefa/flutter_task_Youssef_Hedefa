import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/routing_extension.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/core/routing/routing_constances.dart';

class ExploreOffersWidget extends StatelessWidget {
  const ExploreOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.appTextStyles;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppNumConstants.defaultPadding,
      ),
      child: Row(
        children: [
          Text(
            context.exploreOffers,
            style: textStyle.font16Medium,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              context.pushNamed(AppRoutingConstants.filterView);
            },
            child: Row(
              children: [
                Text(
                  context.all,
                  style: textStyle.font16BoldGreyColor,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: context.appColors.unselectedColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

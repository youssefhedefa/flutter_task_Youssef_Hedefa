import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/features/add_ad/data/models/ad_model.dart';
import 'package:flutter_task/features/add_ad/presentation/view/widgets/package_item_body_widget.dart';
import 'package:flutter_task/features/add_ad/presentation/view/widgets/package_item_header_widget.dart';
import 'package:flutter_task/generated/assets.dart';

class PackageItemWidget extends StatelessWidget {
  const PackageItemWidget({super.key, required this.model, required this.isSelected});

  final PackageModel model;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Stack(
      alignment: AlignmentDirectional.topStart,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(AppNumConstants.defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: appColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: appColors.selectedColor.withValues(
                  alpha: 0.04,
                ),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PackageItemHeaderWidget(
                isSelected: isSelected,
                title: model.title,
                price: model.price,
              ),
              Divider(
                color: appColors.borderColor,
              ),
              12.verticalSpace,
              PackageItemBodyWidget(
                features: model.features,
                numberOfViews: model.numberOfDoubles,
              ),
            ],
          ),
        ),
        if (model.flag != null)
          Positioned(
            top: -16.h,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: 8.w,
                end: 18.w,
                top: 8.h,
                bottom: 8.h,
              ),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesFlagBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                model.flag!,
                textAlign: TextAlign.center,
                style: context.appTextStyles.font12Medium.copyWith(
                  color: appColors.redColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_svg_builder.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/generated/assets.dart';

class PackageItemBodyWidget extends StatefulWidget {
  const PackageItemBodyWidget({super.key, required this.features, required this.numberOfViews});

  final List<String> features;
  final String numberOfViews;

  @override
  State<PackageItemBodyWidget> createState() => _PackageItemBodyWidgetState();
}

class _PackageItemBodyWidgetState extends State<PackageItemBodyWidget> {
  final List<String> icons = [
    Assets.iconsTime,
    Assets.iconsBoost,
    Assets.iconsBin,
    Assets.iconsGlobe,
    Assets.iconsSpecial,
    Assets.iconsBin,
  ];

  @override
  void initState() {
    if (widget.features.length != icons.length) {
      if (widget.features.length > icons.length) {
        while (icons.length < widget.features.length) {
          icons.add(icons.last);
        }
      } else {
        icons.removeRange(widget.features.length, icons.length);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              widget.features.length,
              (index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSvgBuilder(
                    path: icons[index],
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${widget.features[index]}',
                          style: context.appTextStyles.font14Medium,
                        ),
                        if(widget.features[index] == 'تثبيت فى مقاول صحى') Text(
                          ' ( خلال ال48 ساعة القادمة )',
                          style: context.appTextStyles.font14Medium.copyWith(
                            color: appColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        8.horizontalSpace,
        if(widget.numberOfViews != '')Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Assets.imagesNumberOfViewsContainer,
                  ),
                  Text(
                    widget.numberOfViews.toString(),
                    style: context.appTextStyles.font14Medium.copyWith(
                      color: appColors.successColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                context.doubleViews,
                textAlign: TextAlign.center,
                style: context.appTextStyles.font12Regular.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: appColors.selectedColor,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

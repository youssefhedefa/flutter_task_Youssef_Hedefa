import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/select_filter_widget.dart';
import 'package:flutter_task/generated/assets.dart';

class LocationFilterWidget extends StatelessWidget {
  const LocationFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectFilterWidget(
      label: '',
      title: context.location,
      subtitle: context.egypt,
      iconSize: 20,
      buttonChild: Icon(
        Icons.arrow_forward_ios,
        color: context.appColors.selectedColor,
      ),
      iconPath: Assets.iconsLocationOn,
    );
  }
}

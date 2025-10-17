import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/select_filter_widget.dart';
import 'package:flutter_task/generated/assets.dart';

class CategorySectionWidget extends StatelessWidget {
  const CategorySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextStyles = context.appTextStyles;
    return SelectFilterWidget(
      label: context.category,
      title: context.realEstate,
      subtitle: context.villasForSale,
      iconSize: 24,
      buttonChild: Text(
        context.change,
        style: appTextStyles.font14BoldPurpleColor,
      ),
      iconPath: Assets.iconsDonait,
    );
  }
}

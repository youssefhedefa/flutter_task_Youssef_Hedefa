import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class SelectFromOptionsWidget extends StatelessWidget {
  const SelectFromOptionsWidget({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.label,
    this.onOptionSelected,
  });

  final List<String> options;
  final String selectedOption;
  final String label;
  final Function(String)? onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(30.r);
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: AppNumConstants.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.appTextStyles.font16MediumGreyColor,
          ),
          const SizedBox(
            height: 12,
            width: double.infinity,
          ),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: options.map((option) {
              final isSelected = option == selectedOption;
              return InkWell(
                onTap: () {
                  if (onOptionSelected != null) {
                    onOptionSelected!(option);
                  }
                },
                borderRadius: border,
                child: Container(
                  padding: REdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 11.5.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.appColors.primaryColor.withValues(alpha: 0.05)
                        : Colors.transparent,
                    borderRadius: border,
                    border: Border.all(
                      color: isSelected
                          ? context.appColors.primaryColor
                          : context.appColors.unselectedColor,
                    ),
                  ),
                  child: Text(
                    option,
                    style: context.appTextStyles.font14Medium.copyWith(
                      color: isSelected
                          ? context.appColors.primaryColor
                          : context.appColors.unselectedColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

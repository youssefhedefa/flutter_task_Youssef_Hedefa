import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_text_field_widget.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class FromToFilterWidget extends StatelessWidget {
  const FromToFilterWidget({
    super.key,
    required this.label,
    this.fromHint,
    this.toHint,
    this.fromController,
    this.toController,
    this.keyboardType,
  });

  final String label;
  final String? fromHint;
  final String? toHint;
  final TextEditingController? fromController;
  final TextEditingController? toController;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
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
          12.verticalSpace,
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: fromHint,
                  controller: fromController,
                  keyboardType: keyboardType,
                ),
              ),
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: toHint,
                  controller: toController,
                  keyboardType: keyboardType,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

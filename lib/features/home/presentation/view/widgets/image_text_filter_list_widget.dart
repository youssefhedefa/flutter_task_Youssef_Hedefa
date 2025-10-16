import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/image_text_filter_widget.dart';

class ImageTextFilterListWidget extends StatelessWidget {
  const ImageTextFilterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
        itemBuilder: (context, index) => const ImageTextFilterWidget(
          text: 'Pizza',
          imagePath: 'assets/images/pizza.png',
        ),
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemCount: 10,
      ),
    );
  }
}

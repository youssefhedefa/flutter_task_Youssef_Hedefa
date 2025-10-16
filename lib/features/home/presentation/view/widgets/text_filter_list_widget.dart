import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/text_filter_chip_widget.dart';

class TextFilterListWidget extends StatefulWidget {
  const TextFilterListWidget({super.key});

  @override
  State<TextFilterListWidget> createState() => _TextFilterListWidgetState();
}

class _TextFilterListWidgetState extends State<TextFilterListWidget> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
        itemBuilder: (context, index) => TextFilterChipWidget(
          isSelected: index == selectedIndex,
          text: 'Pizza',
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemCount: 10,
      ),
    );
  }
}

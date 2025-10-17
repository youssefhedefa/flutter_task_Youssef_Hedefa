import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/widget_extension.dart';
import 'package:flutter_task/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/image_text_filter_widget.dart';

class ImageTextFilterListWidget extends StatefulWidget {
  const ImageTextFilterListWidget({super.key});

  @override
  State<ImageTextFilterListWidget> createState() => _ImageTextFilterListWidgetState();
}

class _ImageTextFilterListWidgetState extends State<ImageTextFilterListWidget> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCubit.fetchImageCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.fetchImageCategoriesRequestStatus.isLoading) {
          return _loadingWidget();
        } else if (state.fetchImageCategoriesRequestStatus.isFailure) {
          return Center(child: Text(state.fetchImageCategoriesMessage));
        } else if (state.imageCategories.isEmpty) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          height: 78.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
            itemBuilder: (context, index) => ImageTextFilterWidget(
              text: state.imageCategories[index].name,
              imagePath: state.imageCategories[index].imageUrl!,
            ),
            separatorBuilder: (context, index) => 12.horizontalSpace,
            itemCount: state.imageCategories.length,
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return SizedBox(
      height: 78.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
        itemBuilder: (context, index) => Container(
          width: 60.w,
          height: 78.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ).loading(),
        separatorBuilder: (context, index) => 12.horizontalSpace,
        itemCount: 10,
      ),
    );
  }
}

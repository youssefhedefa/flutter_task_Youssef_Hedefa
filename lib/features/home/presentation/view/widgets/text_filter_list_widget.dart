import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/widget_extension.dart';
import 'package:flutter_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/text_filter_chip_widget.dart';

class TextFilterListWidget extends StatefulWidget {
  const TextFilterListWidget({super.key});

  @override
  State<TextFilterListWidget> createState() => _TextFilterListWidgetState();
}

class _TextFilterListWidgetState extends State<TextFilterListWidget> {
  int selectedIndex = 0;
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCubit.fetchTextCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.fetchCategoriesRequestStatus.isLoading) {
          return _loadingWidget();
        } else if (state.fetchCategoriesRequestStatus.isFailure) {
          return Center(child: Text(state.fetchCategoriesMessage));
        } else if (state.categories.isEmpty) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          height: 41.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
            itemBuilder: (context, index) => TextFilterChipWidget(
              isSelected:
                  state.categories[index].id == state.selectedCategoryId ||
                  (state.selectedCategoryId == null && index == 0),
              text: state.categories[index].name,
              onTap: () {
                _homeCubit.emitSelectedCategoryId(
                  state.categories[index].id,
                );
              },
            ),
            separatorBuilder: (context, index) => 8.horizontalSpace,
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return SizedBox(
      height: 41.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppNumConstants.defaultPadding),
        itemBuilder: (context, index) => TextFilterChipWidget(
          isSelected: false,
          text: 'Loading',
          onTap: () {},
        ),
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemCount: 5,
      ),
    ).loading();
  }
}

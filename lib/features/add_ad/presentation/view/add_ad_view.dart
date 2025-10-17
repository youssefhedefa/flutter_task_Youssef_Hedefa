import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/core/components/widgets/custom_button_widget.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/di/injection_container.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/core/extensions/widget_extension.dart';
import 'package:flutter_task/features/add_ad/presentation/cubit/ads_cubit.dart';
import 'package:flutter_task/features/add_ad/presentation/view/widgets/package_item_widget.dart';
import 'package:flutter_task/features/add_ad/presentation/view/widgets/special_package_for_you_widget.dart';

class AddAdView extends StatefulWidget {
  const AddAdView({super.key});

  @override
  State<AddAdView> createState() => _AddAdViewState();
}

class _AddAdViewState extends State<AddAdView> {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    final textStyle = context.appTextStyles;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 34,
        centerTitle: false,
        title: Text(
          context.chooseYourPackages,
          style: textStyle.font14Medium.copyWith(
            fontSize: 24,
          ),
        ),
        leading: Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppNumConstants.defaultPadding,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: context.appColors.selectedColor,
              size: 14,
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<AdsCubit>()..fetchPackages(),
        child: BlocBuilder<AdsCubit, AdsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppNumConstants.defaultPadding,
              ),
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: 24.h,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Text(
                      context.selectFromPremiumPackages,
                      style: textStyle.font14RegularGreyColor,
                    );
                  }
                  if (state.fetchPackagesStatus.isLoading) {
                    return Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: context.appColors.borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: context.appColors.selectedColor.withValues(
                              alpha: 0.04,
                            ),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ).loading();
                  }
                  if (index == state.packages.length + 1) {
                    return Column(
                      children: [
                        const SpecialPackageForYouWidget(),
                        24.verticalSpace,
                        CustomButtonWidget(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.next,
                                style: textStyle.font16Bold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              4.horizontalSpace,
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onTap: () {
                            // Continue action
                          },
                        ),
                      ],
                    );
                  }
                  if (state.fetchPackagesStatus.isSuccess &&
                      state.packages.isNotEmpty) {
                    return InkWell(
                      onTap: () {
                        if (selectedIndexes.contains(index - 1)) {
                          selectedIndexes.remove(index - 1);
                        } else {
                          selectedIndexes.add(index - 1);
                        }
                        setState(() {});
                      },
                      child: PackageItemWidget(
                        model: state.packages[index - 1],
                        isSelected: selectedIndexes.contains(index - 1),
                      ),
                    );
                  }
                  return const SizedBox();
                },
                separatorBuilder: (_, __) => 24.verticalSpace,
                itemCount: state.fetchPackagesStatus.isLoading
                    ? 4
                    : state.packages.length + 2,
              ),
            );
          },
        ),
      ),
    );
  }
}

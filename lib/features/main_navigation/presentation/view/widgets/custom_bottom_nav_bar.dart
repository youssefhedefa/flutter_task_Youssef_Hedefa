import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/core/routing/routing_constances.dart';
import 'package:flutter_task/features/main_navigation/presentation/controllers/main_navigation_cubit/main_navigation_cubit.dart';
import 'package:flutter_task/features/main_navigation/presentation/view/widgets/custom_bottom_nav_bar_item.dart';
import 'package:flutter_task/generated/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.state});

  final MainNavigationState state;

  @override
  Widget build(BuildContext context) {
    final mainNavigationCubit = context.read<MainNavigationCubit>();
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 8,
        children: [
          CustomBottomNavBarItem(
            label: context.home,
            iconPath: Assets.iconsHome,
            isSelected: state.currentIndex == 0,
            onTap: () {
              mainNavigationCubit.updateIndex(0);
            },
          ),
          CustomBottomNavBarItem(
            label: context.chat,
            iconPath: Assets.iconsChat,
            isSelected: state.currentIndex == 1,
            onTap: () {
              mainNavigationCubit.updateIndex(1);
            },
          ),
          CustomBottomNavBarItem(
            label: context.addAd,
            iconPath: Assets.iconsAddAd,
            isSelected: false,
            iconColor: context.appColors.primaryColor,
            onTap: () {
              Navigator.pushNamed(context, AppRoutingConstants.addAdView);
            },
          ),
          CustomBottomNavBarItem(
            label: context.myAds,
            iconPath: Assets.iconsMyAds,
            isSelected: state.currentIndex == 3,
            onTap: () {
              mainNavigationCubit.updateIndex(3);
            },
          ),
          CustomBottomNavBarItem(
            label: context.myAccount,
            iconPath: Assets.iconsProfile,
            isSelected: state.currentIndex == 4,
            onTap: () {
              mainNavigationCubit.updateIndex(4);
            },
          ),
        ],
      ),
    );
  }
}

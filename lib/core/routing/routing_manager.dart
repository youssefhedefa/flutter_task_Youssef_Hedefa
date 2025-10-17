import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/routing/custom_page_route.dart';
import 'package:flutter_task/core/routing/routing_constances.dart';
import 'package:flutter_task/features/add_ad/presentation/view/add_ad_view.dart';
import 'package:flutter_task/features/home/presentation/view/filter_view.dart';
import 'package:flutter_task/features/main_navigation/presentation/controllers/main_navigation_cubit/main_navigation_cubit.dart';
import 'package:flutter_task/features/main_navigation/presentation/view/main_navigation.dart';

class AppRoutingManager {
  AppRoutingManager._privateConstructor();

  static final AppRoutingManager _instance = AppRoutingManager._privateConstructor();

  factory AppRoutingManager() {
    return _instance;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstants.mainNavigationView:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => MainNavigationCubit(),
            child: const MainNavigationView(),
          ),
        );
      case AppRoutingConstants.addAdView:
        return CustomPageRoute(
          child: const AddAdView(),
        );
        case AppRoutingConstants.filterView:
        return CustomPageRoute(
          child: const FilterView(),
        );
      default:
        return null;
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/database/database_service.dart';
import 'package:flutter_task/core/di/injection_container.dart';
import 'package:flutter_task/features/home/data/repo/home_repo.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_offers_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/image_text_filter_list_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/offer_banner_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_grid_view.dart'
    show ProductsGridView;
import 'package:flutter_task/features/home/presentation/view/widgets/text_filter_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    HomeReo(
      databaseService: sl<DatabaseService>(),
    ).fetchProducts(categoryId: null).then((value) {
      value.fold(
        (value) {
          log(value);
        },
        (a) {
          log(a.toString());
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 45.h),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExploreOffersWidget(),
                12.verticalSpace,
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _TextFilterHeaderDelegate(
            child: const TextFilterListWidget(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 33.h),
          sliver: const SliverToBoxAdapter(
            child: ImageTextFilterListWidget(),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OfferBannerWidget(),
              4.verticalSpace,
              const ProductsGridView(),
            ],
          ),
        ),
      ],
    );
  }
}

class _TextFilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TextFilterHeaderDelegate({required this.child});

  @override
  double get minExtent => 41.h + 12.h;

  @override
  double get maxExtent => 41.h + 12.h;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          child,
          12.verticalSpace,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

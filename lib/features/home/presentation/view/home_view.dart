import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_offers_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/image_text_filter_list_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/offer_banner_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_grid_view.dart' show ProductsGridView;
import 'package:flutter_task/features/home/presentation/view/widgets/text_filter_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 45.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExploreOffersWidget(),
          12.verticalSpace,
          const TextFilterListWidget(),
          33.verticalSpace,
          const ImageTextFilterListWidget(),
          33.verticalSpace,
          const OfferBannerWidget(),
          20.verticalSpace,
          const ProductsGridView(),
        ],
      ),
    );
  }
}

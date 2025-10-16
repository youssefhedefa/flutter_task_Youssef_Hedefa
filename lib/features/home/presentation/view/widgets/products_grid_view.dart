import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_item_widget.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 158 / 360,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppNumConstants.defaultPadding,
        vertical: AppNumConstants.defaultPadding,
      ),
      itemBuilder: (context, index) {
        return const ProductItemWidget();
      },
      itemCount: 20,
    );
  }
}

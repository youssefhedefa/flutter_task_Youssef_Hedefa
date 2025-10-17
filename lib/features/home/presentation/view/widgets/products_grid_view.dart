import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/extensions/widget_extension.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_item_widget.dart';
import 'package:flutter_task/generated/assets.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCubit.fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.fetchProductsRequestStatus.isLoading) {
          return _loadingWidget();
        } else if (state.fetchProductsRequestStatus.isFailure) {
          return Center(child: Text(state.fetchProductsMessage));
        } else if (state.products.isEmpty) {
          return const SizedBox.shrink();
        }
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
            return ProductItemWidget(
              model: state.products[index],
            );
          },
          itemCount: state.products.length,
        );
      },
    );
  }

  Widget _loadingWidget() {
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
        return const ProductItemWidget(
          model: ProductModel(
            id: 'id',
            name: 'name',
            imagePath: Assets.imagesShemize,
            currentPrice: 'currentPrice',
            priceBeforeDiscount: 'priceBeforeDiscount',
            numberOfSales: 'numberOfSales',
            isFavorite: false,
            addedToCart: false,
            categoryId: 'categoryId',
          ),
        );
      },
      itemCount: 4,
    ).loading();
  }
}

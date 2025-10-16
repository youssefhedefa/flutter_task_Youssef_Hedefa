import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/features/home/data/models/category_model.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeReo homeRepo})
    : _homeReo = homeRepo,
      super(const HomeState());
  final HomeReo _homeReo;

  Future<void> fetchTextCategories() async {
    emit(state.copyWith(fetchCategoriesRequestStatus: RequestStatusEnum.loading));
    final result = await _homeReo.fetchTextCategories();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            fetchCategoriesRequestStatus: RequestStatusEnum.failure,
            fetchCategoriesMessage: failure,
          ),
        );
      },
      (categories) {
        emit(
          state.copyWith(
            fetchCategoriesRequestStatus: RequestStatusEnum.success,
            categories: categories,
          ),
        );
      },
    );
  }

  emitSelectedCategoryId(String categoryId) {
    emit(state.copyWith(selectedCategoryId: categoryId));
    fetchProducts();
  }

  Future<void> fetchImageCategories() async {
    emit(
      state.copyWith(fetchImageCategoriesRequestStatus: RequestStatusEnum.loading),
    );
    final result = await _homeReo.fetchImageCategories();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            fetchImageCategoriesRequestStatus: RequestStatusEnum.failure,
            fetchImageCategoriesMessage: failure,
          ),
        );
      },
      (categories) {
        emit(
          state.copyWith(
            fetchImageCategoriesRequestStatus: RequestStatusEnum.success,
            imageCategories: categories,
          ),
        );
      },
    );
  }

  Future<void> fetchProducts() async {
    emit(state.copyWith(fetchProductsRequestStatus: RequestStatusEnum.loading));
    final result = await _homeReo.fetchProducts(
      categoryId: state.categories.first.id == state.selectedCategoryId
          ? null
          : state.selectedCategoryId,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            fetchProductsRequestStatus: RequestStatusEnum.failure,
            fetchProductsMessage: failure,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            fetchProductsRequestStatus: RequestStatusEnum.success,
            products: products,
          ),
        );
      },
    );
  }
}

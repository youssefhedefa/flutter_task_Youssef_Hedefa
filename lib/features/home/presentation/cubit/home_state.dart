part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestStatusEnum fetchCategoriesRequestStatus;
  final List<CategoryModel> categories;
  final String fetchCategoriesMessage;
  final String? selectedCategoryId;

  final RequestStatusEnum fetchImageCategoriesRequestStatus;
  final List<CategoryModel> imageCategories;
  final String fetchImageCategoriesMessage;

  final RequestStatusEnum fetchProductsRequestStatus;
  final List<ProductModel> products;
  final String fetchProductsMessage;

  const HomeState({
    this.fetchCategoriesRequestStatus = RequestStatusEnum.loading,
    this.categories = const [],
    this.fetchCategoriesMessage = '',
    this.selectedCategoryId,

    this.fetchImageCategoriesRequestStatus = RequestStatusEnum.loading,
    this.imageCategories = const [],
    this.fetchImageCategoriesMessage = '',

    this.fetchProductsRequestStatus = RequestStatusEnum.loading,
    this.products = const [],
    this.fetchProductsMessage = '',
  });

  HomeState copyWith({
    RequestStatusEnum? fetchCategoriesRequestStatus,
    List<CategoryModel>? categories,
    String? fetchCategoriesMessage,

    RequestStatusEnum? fetchImageCategoriesRequestStatus,
    List<CategoryModel>? imageCategories,
    String? fetchImageCategoriesMessage,

    RequestStatusEnum? fetchProductsRequestStatus,
    List<ProductModel>? products,
    String? fetchProductsMessage,

    String? selectedCategoryId,
  }) {
    return HomeState(
      fetchCategoriesRequestStatus:
          fetchCategoriesRequestStatus ?? this.fetchCategoriesRequestStatus,
      categories: categories ?? this.categories,
      fetchCategoriesMessage: fetchCategoriesMessage ?? this.fetchCategoriesMessage,

      fetchImageCategoriesRequestStatus:
          fetchImageCategoriesRequestStatus ?? this.fetchImageCategoriesRequestStatus,
      imageCategories: imageCategories ?? this.imageCategories,
      fetchImageCategoriesMessage:
          fetchImageCategoriesMessage ?? this.fetchImageCategoriesMessage,

      fetchProductsRequestStatus:
          fetchProductsRequestStatus ?? this.fetchProductsRequestStatus,
      products: products ?? this.products,
      fetchProductsMessage: fetchProductsMessage ?? this.fetchProductsMessage,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props => [
    fetchCategoriesRequestStatus,
    categories,
    fetchCategoriesMessage,
    fetchImageCategoriesRequestStatus,
    imageCategories,
    fetchImageCategoriesMessage,
    fetchProductsRequestStatus,
    products,
    fetchProductsMessage,
    selectedCategoryId,
  ];
}

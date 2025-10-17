part of 'filter_cubit.dart';

class FilterState extends Equatable {
  final TextEditingController fromInstallmentController;
  final TextEditingController toInstallmentController;

  final String? selectedCategory;

  final String? selectedNumberOfBedrooms;

  final TextEditingController fromPriceController;
  final TextEditingController toPriceController;

  final String? selectedPaymentOption;

  final String? selectedPropertyStatue;

  FilterState({
    this.selectedCategory,
    this.selectedNumberOfBedrooms,
    this.selectedPaymentOption,
    this.selectedPropertyStatue,
  }) : fromInstallmentController = TextEditingController(),
       toInstallmentController = TextEditingController(),
       fromPriceController =   TextEditingController(),
       toPriceController =   TextEditingController();

  FilterState copyWith({
    List<String>? categories,
    String? selectedCategory,
    List<String>? numberOfBedrooms,
    String? selectedNumberOfBedrooms,
    List<String>? paymentsOptions,
    String? selectedPaymentOption,
    List<String>? propertyStatues,
    String? selectedPropertyStatue,
  }) {
    return FilterState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedNumberOfBedrooms:
          selectedNumberOfBedrooms ?? this.selectedNumberOfBedrooms,
      selectedPaymentOption: selectedPaymentOption ?? this.selectedPaymentOption,
      selectedPropertyStatue: selectedPropertyStatue ?? this.selectedPropertyStatue,
    );
  }

  @override
  List<Object?> get props => [
    fromInstallmentController,
    toInstallmentController,
    selectedCategory,
    selectedNumberOfBedrooms,
    fromPriceController,
    toPriceController,
    selectedPaymentOption,
    selectedPropertyStatue,
  ];
}

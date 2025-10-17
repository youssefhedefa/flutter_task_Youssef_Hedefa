import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/components/widgets/custom_button_widget.dart';
import 'package:flutter_task/core/constants/app_num_constants.dart';
import 'package:flutter_task/core/di/injection_container.dart';
import 'package:flutter_task/core/extensions/localization_extensions.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';
import 'package:flutter_task/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/category_section_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/from_to_filter_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/location_filter_widget.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/filter_widgets/select_from_options_widget.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.appTextStyles;
    return BlocProvider(
      create: (context) => sl<FilterCubit>(),
      child: Builder(
        builder: (context) {
          final filterCubit = context.read<FilterCubit>();
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 40,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                context.filter,
                style: textStyle.font24Medium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    filterCubit.resetFilter();
                  },
                  child: Text(
                    context.resetDefault,
                    style: textStyle.font16BoldPrimaryColor,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  32.verticalSpace,
                  const CategorySectionWidget(),
                  _customDivider(context),
                  const LocationFilterWidget(),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.fromInstallmentController !=
                            curr.fromInstallmentController ||
                        prev.toInstallmentController != curr.toInstallmentController,
                    builder: (context, state) {
                      return FromToFilterWidget(
                        label: context.monthlyInstallments,
                        fromController: state.fromInstallmentController,
                        toController: state.toInstallmentController,
                      );
                    },
                  ),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedCategory != curr.selectedCategory,
                    builder: (context, state) {
                      return SelectFromOptionsWidget(
                        label: context.type,
                        options: [
                          context.all,
                          context.twinHouse,
                          context.detachedVilla,
                          context.twinHouse,
                        ],
                        selectedOption: state.selectedCategory ?? context.all,
                        onOptionSelected: (option) {
                          filterCubit.emitSelectedCategory(option);
                        },
                      );
                    },
                  ),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedNumberOfBedrooms !=
                        curr.selectedNumberOfBedrooms,
                    builder: (context, state) {
                      return SelectFromOptionsWidget(
                        label: context.rooms,
                        options: [
                          '4 ${context.room}',
                          '5 ${context.room}+',
                          (context.all),
                          (context.twoRooms),
                          '3 ${context.room}',
                        ],
                        selectedOption: state.selectedNumberOfBedrooms ?? context.all,
                        onOptionSelected: (option) {
                          filterCubit.emitSelectedNumberOfBedrooms(option);
                        },
                      );
                    },
                  ),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.fromPriceController != curr.fromPriceController ||
                        prev.toPriceController != curr.toPriceController,
                    builder: (context, state) {
                      return FromToFilterWidget(
                        label: context.price,
                        fromHint: context.minPrice,
                        toHint: context.maxPrice,
                        fromController: state.fromPriceController,
                        toController: state.toPriceController,
                        keyboardType: TextInputType.number,
                      );
                    },
                  ),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedPaymentOption != curr.selectedPaymentOption,
                    builder: (context, state) {
                      return SelectFromOptionsWidget(
                        label: context.paymentMethod,
                        options: [
                          context.any,
                          context.installments,
                          context.cash,
                        ],
                        selectedOption: state.selectedPaymentOption ?? context.cash,
                        onOptionSelected: (option) {
                          filterCubit.emitSelectedPaymentOption(option);
                        },
                      );
                    },
                  ),
                  _customDivider(context),
                  BlocBuilder<FilterCubit, FilterState>(
                    buildWhen: (prev, curr) =>
                        prev.selectedPropertyStatue != curr.selectedPropertyStatue,
                    builder: (context, state) {
                      return SelectFromOptionsWidget(
                        label: context.propertyStatus,
                        options: [
                          context.any,
                          context.ready,
                          context.underConstruction,
                        ],
                        selectedOption: state.selectedPropertyStatue ?? context.any,
                        onOptionSelected: (option) {
                          filterCubit.emitSelectedPropertyStatue(option);
                        },
                      );
                    },
                  ),
                  60.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppNumConstants.defaultPadding,
                    ),
                    child: CustomButtonWidget(
                      child: Text(
                        context.viewResults,
                        style: context.appTextStyles.font16Bold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _customDivider(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        vertical: 20.h,
      ),
      child: Divider(
        thickness: 1,
        height: 1,
        color: context.appColors.borderColor,
      ),
    );
  }
}

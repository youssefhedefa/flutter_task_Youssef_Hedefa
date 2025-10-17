import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
    : super(
        FilterState(),
      );


  resetFilter(){
    emit(FilterState());
  }

  emitSelectedCategory(String category){
    emit(state.copyWith(selectedCategory: category));
  }

  emitSelectedNumberOfBedrooms(String numberOfBedrooms){
    emit(state.copyWith(selectedNumberOfBedrooms: numberOfBedrooms));
  }

  emitSelectedPaymentOption(String paymentOption){
    emit(state.copyWith(selectedPaymentOption: paymentOption));
  }

  emitSelectedPropertyStatue(String propertyStatue){
    emit(state.copyWith(selectedPropertyStatue: propertyStatue));
  }




}

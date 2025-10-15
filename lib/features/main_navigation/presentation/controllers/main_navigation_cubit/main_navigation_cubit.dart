import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(const MainNavigationState());

  void updateIndex(int newIndex) {
    if (newIndex == state.currentIndex) return;
    emit(MainNavigationState(currentIndex: newIndex, views: state.views));
  }
}

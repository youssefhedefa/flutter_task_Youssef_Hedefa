import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color orangeColor;
  final Color redColor;
  final Color successColor;

  const AppColors({
    required this.primaryColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.orangeColor,
    required this.redColor,
    required this.successColor,
  });

  @override
  ThemeExtension<AppColors> copyWith() {
    return AppColors(
      primaryColor: primaryColor,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      orangeColor: orangeColor,
      redColor: redColor,
      successColor: successColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: _lerpColor(primaryColor, other.primaryColor, t),
      selectedColor: _lerpColor(selectedColor, other.selectedColor, t),
      unselectedColor: _lerpColor(unselectedColor, other.unselectedColor, t),
      orangeColor: _lerpColor(orangeColor, other.orangeColor, t),
      redColor: _lerpColor(redColor, other.redColor, t),
      successColor: _lerpColor(successColor, other.successColor, t),
    );
  }

  _lerpColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? a;
  }
}

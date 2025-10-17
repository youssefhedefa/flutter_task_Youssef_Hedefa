import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color orangeColor;
  final Color redColor;
  final Color successColor;
  final Color borderColor;
  final Color purpleColor;

  const AppColors({
    required this.primaryColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.orangeColor,
    required this.redColor,
    required this.successColor,
    required this.borderColor,
    required this.purpleColor,
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
      borderColor: borderColor,
      purpleColor: purpleColor,
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
      borderColor: _lerpColor(borderColor, other.borderColor, t),
      purpleColor: _lerpColor(purpleColor, other.purpleColor, t),
    );
  }

  _lerpColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? a;
  }
}

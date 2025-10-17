import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_string_constants.dart';
import 'package:flutter_task/core/themes/app_colors.dart';
import 'package:flutter_task/core/themes/app_colors_schemes.dart';
import 'package:flutter_task/core/themes/app_text_styles_schemes.dart';

class AppThemes {
  static final AppThemes _instance = AppThemes._internal();

  factory AppThemes() {
    return _instance;
  }

  AppThemes._internal();

  ThemeData get lightTheme {
    final AppColors colors = AppColorsSchemes.lightColor;
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primaryColor,
      colorScheme: ColorScheme.light(
        primary: colors.primaryColor,
        error: colors.redColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      hintColor: colors.unselectedColor,
      iconTheme: IconThemeData(color: colors.selectedColor),
      scaffoldBackgroundColor: Colors.white,
      textTheme: ThemeData().textTheme.apply(
        fontFamily: AppStringConstants.tajawalFontFamily,
        bodyColor: colors.selectedColor,
        displayColor: colors.selectedColor,
      ),
      extensions: [colors, AppTextStylesSchemes.lightTextStyles],
    );
  }

  ThemeData get darkTheme {
    return lightTheme;
  }
}

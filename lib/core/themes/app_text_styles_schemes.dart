import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/app_colors.dart';
import 'package:flutter_task/core/themes/app_colors_schemes.dart';
import 'package:flutter_task/core/themes/app_text_styles.dart';

abstract class AppTextStylesSchemes {
  static final AppColors _lightColors = AppColorsSchemes.lightColor;
  static AppTextStyles lightTextStyles = AppTextStyles(
    font16Bold: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: _lightColors.selectedColor,
    ),
    font16BoldOrangeColor: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: _lightColors.orangeColor,
    ),
    font14RegularGreyColor: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: _lightColors.unselectedColor,
    ),
    font12Medium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: _lightColors.selectedColor,
    ),
    font14Medium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _lightColors.selectedColor,
    ),
    font16Medium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _lightColors.selectedColor,
    ),
    font10Regular: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _lightColors.selectedColor,
    ),
    font10RegularGreyColor: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: _lightColors.unselectedColor,
    ),
    font12Regular: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _lightColors.selectedColor,
    ),
    font12RegularSuccessColor: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _lightColors.successColor,
    ),
    font14MediumGreyColor: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _lightColors.unselectedColor,
    ),
    font14MediumOrangeColor: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _lightColors.orangeColor,
    ),
    font14MediumRedColor: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: _lightColors.redColor,
    ),
    font16BoldGreyColor: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: _lightColors.unselectedColor,
    ),
  );
}

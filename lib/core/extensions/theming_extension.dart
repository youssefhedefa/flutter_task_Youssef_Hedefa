import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/app_colors.dart';
import 'package:flutter_task/core/themes/app_text_styles.dart';

extension ThemingExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  AppTextStyles get appTextStyles => Theme.of(this).extension<AppTextStyles>()!;
}
import 'dart:ui';

import 'package:flutter_task/core/themes/app_colors.dart';

abstract class AppColorsSchemes {
  static AppColors lightColor = AppColors(
    primaryColor: Color(0xFF0062E2),
    selectedColor: Color(0xFF090F1F),
    unselectedColor: Color(0xFF090F1F).withValues(
      alpha: 0.5,
    ),
    orangeColor: Color(0xFFF95B1C),
    redColor: Color(0xFFFF4144),
    successColor: Color(0xff3A813F)
  );

  static AppColors darkColor = lightColor;
}

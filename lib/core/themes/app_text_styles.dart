import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle font10Regular;
  final TextStyle font10RegularGreyColor;

  final TextStyle font12Regular;
  final TextStyle font12RegularGreyColor;
  final TextStyle font12RegularSuccessColor;
  final TextStyle font12Medium;

  final TextStyle font14RegularGreyColor;
  final TextStyle font14Medium;
  final TextStyle font14MediumPrimaryColor;
  final TextStyle font14MediumOrangeColor;
  final TextStyle font14MediumRedColor;
  final TextStyle font14MediumGreyColor;
  final TextStyle font14BoldPurpleColor;

  final TextStyle font16Medium;
  final TextStyle font16MediumGreyColor;
  final TextStyle font16BoldGreyColor;
  final TextStyle font16BoldOrangeColor;
  final TextStyle font16Bold;
  final TextStyle font16BoldPrimaryColor;

  final TextStyle font24Medium;

  const AppTextStyles({
    required this.font12Regular,
    required this.font12Medium,
    required this.font14RegularGreyColor,
    required this.font14MediumOrangeColor,
    required this.font14MediumGreyColor,
    required this.font16Medium,
    required this.font16BoldGreyColor,
    required this.font10Regular,
    required this.font10RegularGreyColor,
    required this.font12RegularSuccessColor,
    required this.font14Medium,
    required this.font14MediumRedColor,
    required this.font16Bold,
    required this.font16BoldOrangeColor,
    required this.font16BoldPrimaryColor,
    required this.font24Medium,
    required this.font14MediumPrimaryColor,
    required this.font12RegularGreyColor,
    required this.font16MediumGreyColor,
    required this.font14BoldPurpleColor,
  });

  @override
  ThemeExtension<AppTextStyles> copyWith() {
    return AppTextStyles(
      font12Regular: font12Regular,
      font14MediumOrangeColor: font14MediumOrangeColor,
      font14MediumGreyColor: font14MediumGreyColor,
      font16Medium: font16Medium,
      font16BoldGreyColor: font16BoldGreyColor,
      font10Regular: font10Regular,
      font10RegularGreyColor: font10RegularGreyColor,
      font12RegularSuccessColor: font12RegularSuccessColor,
      font14Medium: font14Medium,
      font14MediumRedColor: font14MediumRedColor,
      font12Medium: font12Medium,
      font14RegularGreyColor: font14RegularGreyColor,
      font16Bold: font16Bold,
      font16BoldOrangeColor: font16BoldOrangeColor,
      font12RegularGreyColor: font12RegularGreyColor,
      font16MediumGreyColor: font16MediumGreyColor,
      font14MediumPrimaryColor: font14MediumPrimaryColor,
      font14BoldPurpleColor: font14BoldPurpleColor,
      font16BoldPrimaryColor: font16BoldPrimaryColor,
      font24Medium: font24Medium,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    covariant ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      font12Regular: _lerpTextStyle(font12Regular, other.font12Regular, t),
      font14MediumOrangeColor: _lerpTextStyle(
        font14MediumOrangeColor,
        other.font14MediumOrangeColor,
        t,
      ),
      font14MediumGreyColor: _lerpTextStyle(
        font14MediumGreyColor,
        other.font14MediumGreyColor,
        t,
      ),
      font16Medium: _lerpTextStyle(font16Medium, other.font16Medium, t),
      font16BoldGreyColor: _lerpTextStyle(
        font16BoldGreyColor,
        other.font16BoldGreyColor,
        t,
      ),
      font10Regular: _lerpTextStyle(font10Regular, other.font10Regular, t),
      font10RegularGreyColor: _lerpTextStyle(
        font10RegularGreyColor,
        other.font10RegularGreyColor,
        t,
      ),
      font12RegularSuccessColor: _lerpTextStyle(
        font12RegularSuccessColor,
        other.font12RegularSuccessColor,
        t,
      ),
      font14Medium: _lerpTextStyle(font14Medium, other.font14Medium, t),
      font14MediumRedColor: _lerpTextStyle(
        font14MediumRedColor,
        other.font14MediumRedColor,
        t,
      ),
      font12Medium: _lerpTextStyle(font12Medium, other.font12Medium, t),
      font14RegularGreyColor: _lerpTextStyle(
        font14RegularGreyColor,
        other.font14RegularGreyColor,
        t,
      ),
      font16Bold: _lerpTextStyle(font16Bold, other.font16Bold, t),
      font16BoldOrangeColor: _lerpTextStyle(
        font16BoldOrangeColor,
        other.font16BoldOrangeColor,
        t,
      ),
      font12RegularGreyColor: _lerpTextStyle(
        font12RegularGreyColor,
        other.font12RegularGreyColor,
        t,
      ),
      font16MediumGreyColor: _lerpTextStyle(
        font16MediumGreyColor,
        other.font16MediumGreyColor,
        t,
      ),
      font14MediumPrimaryColor: _lerpTextStyle(
        font14MediumPrimaryColor,
        other.font14MediumPrimaryColor,
        t,
      ),
      font14BoldPurpleColor: _lerpTextStyle(
        font14BoldPurpleColor,
        other.font14BoldPurpleColor,
        t,
      ),
      font16BoldPrimaryColor: _lerpTextStyle(
        font16BoldPrimaryColor,
        other.font16BoldPrimaryColor,
        t,
      ),
      font24Medium: _lerpTextStyle(font24Medium, other.font24Medium, t),
    );
  }

  _lerpTextStyle(TextStyle a, TextStyle b, double t) {
    return TextStyle.lerp(a, b, t) ?? a;
  }
}

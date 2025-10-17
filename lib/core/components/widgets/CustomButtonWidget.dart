import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.child,
  });

  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 12.5,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.appColors.primaryColor,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: child,
      ),
    );
  }
}

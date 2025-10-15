import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/widgets/custom_svg_builder.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.label,
    this.onTap,
  });

  final bool isSelected;
  final String iconPath;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          // padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: isSelected ? BorderSide(color: Colors.red, width: 1.2) : BorderSide.none,
            ),
            borderRadius: borderRadius,
          ),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgBuilder(path: iconPath),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: isSelected ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

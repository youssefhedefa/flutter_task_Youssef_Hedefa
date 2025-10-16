import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class AddToCartButtonWidget extends StatefulWidget {
  const AddToCartButtonWidget({super.key, this.isInCart});

  final bool? isInCart;

  @override
  State<AddToCartButtonWidget> createState() => _AddToCartButtonWidgetState();
}

class _AddToCartButtonWidgetState extends State<AddToCartButtonWidget> {

  late bool isInCart;

  @override
  void initState() {
    isInCart = widget.isInCart ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4);
    return InkWell(
      onTap: () {
        setState(() {
          isInCart = !isInCart;
        });
      },
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.appColors.borderColor,
            width: 1,
          ),
          borderRadius: borderRadius,
        ),
        child: Icon(
          isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
          color: context.appColors.selectedColor,
        ),
      ),
    );
  }
}

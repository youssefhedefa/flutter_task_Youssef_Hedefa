import 'package:flutter/material.dart';
import 'package:flutter_task/core/extensions/theming_extension.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({super.key, this.isFavorite});

  final bool? isFavorite;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : context.appColors.selectedColor,
      ),
    );
  }
}

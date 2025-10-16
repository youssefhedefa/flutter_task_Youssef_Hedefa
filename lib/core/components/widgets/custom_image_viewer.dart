import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/components/widgets/custom_cached_network_image_widget.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: imagePath.startsWith('http')
          ? CustomCachedNetworkImageWidget(
        imageUrl: imagePath,
        width: width ?? 46,
        height: height ?? 46,
        fit: fit ?? BoxFit.contain,
      )
          : File(imagePath).existsSync()
          ? Image.file(
        File(imagePath),
        fit: fit ?? BoxFit.contain,
      )
          : Image.asset(
        imagePath,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
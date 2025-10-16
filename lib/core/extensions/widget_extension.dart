import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension WidgetExtensions on Widget {
  Widget loading({bool enabled = true}) {
    return Skeletonizer(enabled: enabled, child: this);
  }
}
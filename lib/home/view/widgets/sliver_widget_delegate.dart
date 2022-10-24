import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class SliverWidgetDelegate extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double height;
  final Color? backgroundColor;
  final bool isShouldRebuild;

  SliverWidgetDelegate({
    required this.widget,
    this.height = 50,
    this.backgroundColor,
    this.isShouldRebuild = false,
  });

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: height,
      child: widget,
      color: backgroundColor ?? AppColors.white,
    );
  }

  @override
  bool shouldRebuild(SliverWidgetDelegate oldDelegate) {
    return isShouldRebuild;
  }
}

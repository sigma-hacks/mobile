import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';

class Wrapper extends StatelessWidget {
  final Color color;
  final double margin;
  final double padding;
  final Widget child;
  const Wrapper({
    super.key,
    required this.child,
    this.color = AppColors.white,
    this.margin = 32,
    this.padding = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

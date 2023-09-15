import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  const Wrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      margin: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

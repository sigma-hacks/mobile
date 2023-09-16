import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class FinalCost extends StatelessWidget {
  final double cost;
  const FinalCost({
    super.key,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'К оплате',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.blue),
        ),
        Text(
          '$cost ₽',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 40, color: AppColors.blue),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class Transport extends StatelessWidget {
  const Transport({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Маршрут',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '150 А',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.blue),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Номер Т/С',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'А123АА777',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.blue),
            ),
          ],
        ),
      ],
    );
  }
}

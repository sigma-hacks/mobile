import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class DateTimeTicket extends StatelessWidget {
  const DateTimeTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Дата покупки',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '15.09.2023',
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
              'Время',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '08:42',
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

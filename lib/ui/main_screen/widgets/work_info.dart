import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import 'start_form.dart';

class WorkInfo extends StatelessWidget {
  const WorkInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Смена начата'),
        Divider(
          color: AppColors.blueLight,
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          child: Text('Завершить смену'),
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
        ),
        const SizedBox(height: 12),
        Text('ФИО'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Номер Т/С'),
                const SizedBox(height: 8),
                Text(
                  'АБ2234В 51RUS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ],
            ),
            Column(
              children: [
                Text('Маршрут'),
                const SizedBox(height: 8),
                Text(
                  '250А',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

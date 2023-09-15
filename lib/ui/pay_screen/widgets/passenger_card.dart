import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../common/wrapper.dart';

class PassengerCard extends StatelessWidget {
  const PassengerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
        margin: 0,
        color: AppColors.blueLighter,
        child: Column(
          children: [
            Text('ФИО'),
            SizedBox(height: 24),
            Text('Тариф:'),
            Text(
              'Школьный',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 24),
            Text('2202-10**-****-3325'),
            Text(
              'до 01.01.2026',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}

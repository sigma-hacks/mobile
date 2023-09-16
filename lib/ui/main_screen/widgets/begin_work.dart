import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import 'start_form.dart';

class BeginWork extends StatelessWidget {
  const BeginWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Начало смены',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            color: AppColors.blueLight,
          ),
          Text('ФИО'),
          const SizedBox(height: 16),
          StartForm(),
        ],
      ),
    );
  }
}

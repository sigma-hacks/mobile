import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import 'start_form.dart';

class BeginWork extends StatelessWidget {
  const BeginWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Начало смены'),
        Divider(
          color: AppColors.blueLight,
        ),
        Text('ФИО'),
        const SizedBox(height: 16),
        StartForm(),
      ],
    );
  }
}

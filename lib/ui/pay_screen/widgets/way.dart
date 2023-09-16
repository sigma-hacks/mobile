import 'package:ekzh/ui/common/wrapper.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class Way extends StatelessWidget {
  const Way({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
        margin: 0,
        padding: 16,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'От остановки',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'ос. Киреевская',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.blue),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_double_arrow_right_rounded,
              color: AppColors.blue,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'До остановки',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'зав. Пустынный',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.blue),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

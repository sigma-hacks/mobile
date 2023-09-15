import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class Way extends StatelessWidget {
  const Way({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.blue, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'От остановки',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  'ос. Киреевская',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          Icon(
            Icons.double_arrow_rounded,
            color: AppColors.white,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'До остановки',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  'зав. Пустынный',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

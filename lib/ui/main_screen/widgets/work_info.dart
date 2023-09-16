import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';
import '../../../cubits/ui_cubit.dart';
import '../../../models/work.dart';
import '../../common/out_button.dart';

class WorkInfo extends StatelessWidget {
  const WorkInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Смена #999',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Divider(color: AppColors.blueLight),
        const SizedBox(height: 20),
        OutButton(
          contentColor: AppColors.blue,
          fillColor: AppColors.white,
          text: 'Завершить смену',
          onTap: () {
            BlocProvider.of<UiCubit>(context).updateWork(Work.stop);
          },
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: AppColors.blueLighter,
          radius: 50,
          child: Image.asset(
            'assets/icons/avatar.png',
            width: 65,
          ),
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

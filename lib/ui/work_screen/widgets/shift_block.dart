import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';
import '../../../cubits/ui_cubit.dart';
import '../../../models/work.dart';
import 'date_time_work.dart';
import '../../common/out_button.dart';

class ShiftBlock extends StatelessWidget {
  const ShiftBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Смена #999',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Divider(color: AppColors.blueLight),
        const SizedBox(height: 10),
        OutButton(
          contentColor: AppColors.blue,
          fillColor: AppColors.white,
          text: 'Завершить смену',
          onTap: () {
            BlocProvider.of<UiCubit>(context).updateWork(Work.stop);
          },
        ),
        const SizedBox(height: 10),
        DateTimeWork(
          dateTime: DateTime(2023, 9, 15, 8, 42),
        ),
      ],
    );
  }
}

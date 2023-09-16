import 'package:ekzh/common/navigation/route_name.dart';
import 'package:ekzh/ui/common/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Stack(
      children: [
        Wrapper(
          verticalPadding: 0,
          horizontalPadding: 0,
          margin: 0,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
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
                Text(
                  'Петров И.И.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Номер Т/С',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'АБ2234В 51RUS',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Маршрут',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '250А',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.75,
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: AppColors.white.withOpacity(0.95),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyDark,
                          blurRadius: 5,
                        )
                      ]),
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          context.pushNamed(RouteName.check);
                        },
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.blueLighter,
                        ),
                        title: Text('ФИО'),
                        subtitle: Text('20.03.2023 в 14:52'),
                        trailing: Text(
                          '32 ₽',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'История оплат',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Divider(
                        color: AppColors.blueLight,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}

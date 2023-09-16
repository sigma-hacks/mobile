import 'package:ekzh/common/navigation/route_name.dart';
import 'package:ekzh/cubits/ui_cubit.dart';
import 'package:ekzh/ui/common/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/state/app_state.dart';
import '../../../models/work.dart';
import 'begin_route.dart';
import 'route_block.dart';
import 'shift_block.dart';

class WorkInfo extends StatelessWidget {
  const WorkInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: BlocBuilder<UiCubit, AppState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShiftBlock(),
                    const SizedBox(height: 20),
                    state.currentWork == Work.paused
                        ? BeginRoute()
                        : const RouteBlock(),
                  ],
                );
              },
            ),
          ),
        ),
        // DraggableScrollableSheet(
        //   initialChildSize: 0.3,
        //   maxChildSize: 0.75,
        //   builder: (BuildContext context, ScrollController scrollController) {
        //     return Stack(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //               borderRadius:
        //                   BorderRadius.vertical(top: Radius.circular(20)),
        //               color: AppColors.white.withOpacity(0.95),
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: AppColors.greyDark,
        //                   blurRadius: 5,
        //                 )
        //               ]),
        //           padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        //           child: ListView.builder(
        //             controller: scrollController,
        //             itemCount: 50,
        //             itemBuilder: (BuildContext context, int index) {
        //               return ListTile(
        //                 onTap: () {
        //                   context.pushNamed(RouteName.check);
        //                 },
        //                 leading: CircleAvatar(
        //                   radius: 20,
        //                   backgroundColor: AppColors.blueLighter,
        //                 ),
        //                 title: Text('ФИО'),
        //                 subtitle: Text('20.03.2023 в 14:52'),
        //                 trailing: Text(
        //                   '32 ₽',
        //                   style: Theme.of(context).textTheme.titleSmall,
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //         Align(
        //           alignment: Alignment.topCenter,
        //           child: Column(
        //             children: [
        //               const SizedBox(height: 8),
        //               Text(
        //                 'История оплат',
        //                 style: Theme.of(context).textTheme.titleMedium,
        //               ),
        //               const Divider(
        //                 color: AppColors.blueLight,
        //                 indent: 20,
        //                 endIndent: 20,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // )
      ],
    );
  }
}

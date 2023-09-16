import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/ui_cubit.dart';
import '../../models/state/app_state.dart';
import '../../models/work.dart';
import '../common/wrapper.dart';
import 'widgets/begin_work.dart';
import 'widgets/work_info.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrapper(
        child: BlocBuilder<UiCubit, AppState>(
          builder: (context, state) {
            return state.currentWork == Work.stop ? BeginWork() : WorkInfo();
          },
        ),
      ),
    );
  }
}

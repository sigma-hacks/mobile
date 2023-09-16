import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/app_tabs.dart';
import '../models/state/app_state.dart';
import '../models/work.dart';

class UiCubit extends Cubit<AppState> {
  UiCubit() : super(const AppState());

  void updateTab(AppTabs newTab) {
    emit(state.copyWith(currentTab: newTab));
  }

  void updateWork(Work newWork) {
    emit(state.copyWith(currentWork: newWork));
  }
}

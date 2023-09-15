import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_tabs.dart';
import '../work.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppTabs.main) AppTabs currentTab,
    @Default(Work.stop) Work currentWork,
  }) = _AppState;
}
import 'dart:async';

import 'package:ekzh/services/https_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../models/app_tabs.dart';
import '../models/state/app_state.dart';
import '../models/work.dart';
import '../services/reachability_service.dart';

class UiCubit extends Cubit<AppState> {
  UiCubit(this.repo) : super(const AppState());

  final ReachabilityService repo;

  void updateTab(AppTabs newTab) {
    emit(state.copyWith(currentTab: newTab));
  }

  void updateWork(Work newWork) {
    emit(state.copyWith(currentWork: newWork));
  }

  Future<void> listenToConnectivity() async {
    repo.onStatusChange.listen((result) {
      if (result == InternetStatus.connected) {
        emit(state.copyWith(isConnection: true));
      } else {
        emit(state.copyWith(isConnection: false));
      }
    });
  }

  Future tryAuth(String login,String password) async {
    try {
      final result = await HttpsService().auth(
        email: login, 
        pass: password, 
        type: AuthType.password);
        emit(state.copyWith(isAuthorized: true));
        return result;
    } catch (e) {
      emit(state.copyWith(isAuthorized: false));
    }
  }
}

import 'dart:async';

import 'package:ekzh/services/entities/register.dart';
import 'package:ekzh/services/https_service.dart';
import 'package:ekzh/services/reachability_service.dart';

class Repository {
  final _httpService = HttpsService();
  final _reachabilityServer = ReachabilityService();

  late final Timer _timer;

  Future updateRegister() async {
    return _httpService.getRegistr(lastUpdate: DateTime.now());
  }

  void startGettingRegistr() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      try {
        final list = await _httpService.getRegistr(lastUpdate: DateTime.now());
        // const entity = RegistrEntity(id: "123", name: "1234");
        // update register
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void stopGettingregistr() {
    _timer.cancel();
  }
}

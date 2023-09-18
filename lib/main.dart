import 'dart:async';
import 'dart:developer';

import 'package:ekzh/services/Https_debug_support/my_http_overrides.dart';
import 'package:ekzh/services/crypto_service.dart';
import 'package:ekzh/services/https_service.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
// import 'package:nfc_classic_mifare/nfc_classic_mifare.dart';

import 'services/Https_debug_support/my_http_overrides.dart';
import 'services/crypto_service.dart';
import 'ui/app.dart';
import 'dart:io';

ValueNotifier<dynamic> result = ValueNotifier(null);

// диспоус контроллера!!!
late final StreamController<bool> controller;

// final Stream<bool> isNfc = (() {
//   controller = StreamController<bool>(
//     onListen: () async {
//       await Future<void>.delayed(const Duration(milliseconds: 500));
//       final isN = await NfcManager.instance.isAvailable();
//       print(isN);
//       controller.add(isN);
//     },
//   );
//   return controller.stream;
// })();

void main() async {
  // remove httpOverrides on production
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CryptoService().initialize();

  // var result = await HttpsService().auth(email: "test@mail.ru", pass: "123qwe123");
  // print(result);

  // // Check availability
  // AVAILABILITY isAvailable = await NfcClassicMifare.availability;
  // switch (isAvailable) {
  //   case (AVAILABILITY.AVAILABLE):
  //     //NFC is enabled.
  //     log('NFC is enabled');
  //     break;
  //   case (AVAILABILITY.NOT_ENABLED):
  //     //The phone support NFC but user has to enable it.
  //     log('The phone support NFC but user has to enable it');
  //     break;
  //   case (AVAILABILITY.NOT_SUPPORTED):
  //     //The phone doesn't support NFC.
  //     log('The phone doesnt support NFC');
  //     break;
  // }

  runApp(const App());
}

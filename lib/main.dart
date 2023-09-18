import 'package:ekzh/services/https_debug_support/my_http_overrides.dart';
import 'package:ekzh/services/crypto_service.dart';
import 'package:ekzh/services/https_service.dart';
import 'package:flutter/material.dart';
// import 'package:nfc_classic_mifare/nfc_classic_mifare.dart';

import 'services/crypto_service.dart';
import 'ui/app.dart';
import 'dart:io';

void main() async {
  // remove httpOverrides on production
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CryptoService().initialize();

  runApp(const App());
}

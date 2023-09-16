import 'package:ekzh/services/Https_debug_support/my_http_overrides.dart';
import 'package:ekzh/services/crypto_service.dart';
import 'package:ekzh/services/https_service.dart';
import 'package:flutter/material.dart';

import 'ui/app.dart';
import 'dart:io';

void main() async {
  // remove httpOverrides on production
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CryptoService().initialize();

  var result = await HttpsService().auth(email: "test@mail.ru", pass: "123qwe123");
  print(result);

  runApp(const App());
}

import 'package:ekzh/services/crypto_service.dart';
import 'package:flutter/material.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CryptoService().initialize();
  runApp(const App());
}

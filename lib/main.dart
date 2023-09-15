import 'package:ekzh/services/crypto_service.dart';
import 'package:flutter/material.dart';

import 'ui/app.dart';

void main() async {
  
  runApp(const App());

  await CryptoService().initialize();
  var encoded = await CryptoService().encode("1234567890");
  print(encoded);
  var decoded = await CryptoService().decode("tIHjeBm/5m+En42iVpEVFg==");
  print(decoded);
}

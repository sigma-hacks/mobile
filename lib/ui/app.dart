import 'package:flutter/material.dart';

import '../common/navigation/router.dart';
import '../common/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ЕКЖ',
      theme: themeLight,
      routerConfig: router,
    );
  }
}

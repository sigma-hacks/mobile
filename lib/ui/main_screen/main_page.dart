import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green,
      child: Center(
        child: Text('Тут много всего'),
      ),
    );
  }
}

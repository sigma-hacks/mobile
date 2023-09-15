import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      child: Center(
        child: Text('И здесь тоже'),
      ),
    );
  }
}

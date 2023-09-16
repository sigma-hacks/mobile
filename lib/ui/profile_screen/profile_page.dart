import 'package:ekzh/common/navigation/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/theme/app_colors.dart';
import 'widgets/menu_itemю.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blueLighter,
              radius: 50,
              child: Image.asset(
                'assets/icons/avatar.png',
                width: 65,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Петров И.И.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            MenuItem(text: 'Мои смены'),
            MenuItem(text: 'Обращения и жалобы'),
            MenuItem(text: 'О приложении'),
            TextButton(
              onPressed: () {
                context.goNamed(RouteName.login);
              },
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}

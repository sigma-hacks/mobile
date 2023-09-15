import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../common/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.green, AppColors.greenDark])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Вход в личный кабинет',
                ),
                const SizedBox(height: 12),
                const Text(
                  'Для входа в личный кабинет выберите полномочие и авторизуйтесь',
                ),
                const SizedBox(height: 32),
                const Text('Номер сотрудника'),
                const SizedBox(height: 8),
                TextFormField(),
                const SizedBox(height: 12),
                const Text('Код авторизации'),
                const SizedBox(height: 8),
                TextFormField(),
                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: () {
                    context.goNamed(RouteName.base);
                  },
                  child: const Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

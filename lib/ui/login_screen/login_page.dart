import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../common/logo_text.dart';
import 'widgets/auth_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.green, AppColors.greenDark])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(28),
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LogoText(),
                  const SizedBox(height: 32),
                  Text(
                    'Вход в личный кабинет',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Для входа в личный кабинет выберите полномочие и авторизуйтесь',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const AuthForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

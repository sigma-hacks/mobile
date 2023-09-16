import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/theme/app_colors.dart';
import '../../common/out_button.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late TextEditingController loginController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    loginController = TextEditingController()..text = 'test@mail.ru';
    passwordController = TextEditingController()..text = '123qwe123';
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Номер сотрудника'),
          const SizedBox(height: 8),
          TextFormField(
            controller: loginController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите логин';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          const Text('Код авторизации'),
          const SizedBox(height: 8),
          TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите пароль';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          OutButton(
            contentColor: AppColors.blue,
            fillColor: AppColors.white,
            text: 'Войти',
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.goNamed(RouteName.base);
              }
            },
          ),
          // Center(
          //   child: OutlinedButton(
          //     onPressed: () {
          // if (formKey.currentState!.validate()) {
          //   context.goNamed(RouteName.base);
          // }
          //     },
          //     child: const Text('Войти'),
          //   ),
          // ),
        ],
      ),
    );
  }
}

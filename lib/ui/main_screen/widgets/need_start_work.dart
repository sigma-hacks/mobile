import 'package:ekzh/cubits/app_cubit.dart';
import 'package:ekzh/models/app_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NeedStartWork extends StatelessWidget {
  final String text;
  const NeedStartWork({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AppCubit>(context).updateTab(AppTabs.work);
          },
          child: const Text('Ввести данные'),
        ),
      ],
    );
  }
}

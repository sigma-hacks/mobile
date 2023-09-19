import 'package:ekzh/services/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';

class RegistryUpdate extends StatefulWidget {
  final bool isConnect;
  const RegistryUpdate({
    super.key,
    required this.isConnect,
  });

  @override
  State<RegistryUpdate> createState() => _RegistryUpdateState();
}

class _RegistryUpdateState extends State<RegistryUpdate> {

  Future<void> getCards() async {
    final postsCubit = context.read<CardCubit>();
    await postsCubit.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await getCards();
      },
      child: Ink(
          child: Row(
        children: [
          Icon(
            widget.isConnect ? Icons.update : Icons.update_disabled,
            color: AppColors.grey,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.isConnect ? 'Обновить реестр' : 'Невозможно обновить реестр'),
              Text(
                'последнее обновление в 14:09',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

import 'package:ekzh/cubits/card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';
// import 'package:intl/intl.dart';

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

  DateTime? lastUpdate;

  Future<void> getCards() async {
    final postsCubit = context.read<CardCubit>();
    await postsCubit.getCards();
  }

  @override
  void initState() {
    super.initState();
    final postsCubit = context.read<CardCubit>();
    postsCubit.getLastUpdateDateTime().then((value) {
      setState(() {
        this.lastUpdate = value;
      });
    });
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
                lastUpdate != null ? 'последнее обновление ${lastUpdate!.day}.${lastUpdate!.month}.${lastUpdate!.year} в ${lastUpdate!.hour}:${lastUpdate!.minute}' : 'Обновлений не было',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      )),
    );
  }
}

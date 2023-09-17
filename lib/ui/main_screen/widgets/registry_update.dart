import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class RegistryUpdate extends StatelessWidget {
  final bool isConnect;
  const RegistryUpdate({
    super.key,
    required this.isConnect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
          child: Row(
        children: [
          Icon(
            isConnect ? Icons.update : Icons.update_disabled,
            color: AppColors.grey,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  isConnect ? 'Обновить реестр' : 'Невозможно обновить реестр'),
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

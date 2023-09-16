import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const MenuItem({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greyLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

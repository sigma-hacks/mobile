import 'package:flutter/material.dart';
import '../../../common/theme/app_colors.dart';

class PaymentMethod extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final Color contentColor;
  final String text;
  final IconData icon;
  const PaymentMethod({
    super.key,
    this.borderColor = AppColors.blueLight,
    required this.contentColor,
    required this.fillColor,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        // context.goNamed(RouteName.check);
      },
      child: Ink(
        padding: const EdgeInsets.all(16),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: fillColor,
          border: Border.all(color: borderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: contentColor),
            Text(
              text.toUpperCase(),
              style: TextStyle(color: contentColor),
            )
          ],
        ),
      ),
    );
  }
}

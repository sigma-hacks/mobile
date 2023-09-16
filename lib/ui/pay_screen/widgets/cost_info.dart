import 'package:flutter/material.dart';

class CostInfo extends StatelessWidget {
  final int fullCost;
  final double sale;
  const CostInfo({
    super.key,
    required this.fullCost,
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Стоимость проезда'),
            Text(
              '$fullCost ₽',
              // style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Скидка'),
            Text(
              '$sale ₽',
              // style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}

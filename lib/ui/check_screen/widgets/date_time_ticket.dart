import 'package:flutter/material.dart';

class DateTimeTicket extends StatelessWidget {
  const DateTimeTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Дата покупки',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text('15.09.2023'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Время',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text('08:42'),
          ],
        ),
      ],
    );
  }
}

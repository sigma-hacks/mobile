import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/theme/app_colors.dart';
import '../../models/passenger.dart';
import 'wrapper.dart';

class PassengerCard extends StatelessWidget {
  final Passenger passenger;
  const PassengerCard({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
        margin: 0,
        color: AppColors.blueLighter,
        child: Column(
          children: [
            Text(
              passenger.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              '${DateTime.now().difference(passenger.bday).inDays ~/ 365} лет',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              DateFormat('dd.MM.yyyy').format(passenger.bday),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 18),
            const Text('Тариф:'),
            Text(
              passenger.tariff.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 18),
            Text(passenger.cardNumber),
            Text(
              'до 01.01.2026',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}

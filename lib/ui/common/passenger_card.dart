import 'package:flutter/material.dart';

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
            SizedBox(height: 18),
            Text('Тариф:'),
            Row(
              children: [
                Spacer(),
                Text(
                  passenger.tariff.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.grey,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text(passenger.cardNumber),
            Text(
              'до 01.01.2026',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}

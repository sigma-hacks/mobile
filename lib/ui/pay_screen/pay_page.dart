import 'package:ekzh/models/passenger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/theme/app_colors.dart';
import 'widgets/cost_info.dart';
import 'widgets/final_cost.dart';
import 'widgets/passenger_card.dart';
import 'widgets/payment_method.dart';
import 'widgets/way.dart';

class PayPage extends StatelessWidget {
  final Passenger? passenger;
  const PayPage({
    super.key,
    this.passenger,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.blue,
                  )),
            ),
            passenger == null
                ? const Center(child: CircularProgressIndicator())
                : Builder(builder: (context) {
                    int fullCost = 25;
                    double sale = fullCost * (1 - passenger!.tariff.sale / 100);
                    double finalCost = fullCost - sale;

                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, top: 32, bottom: 12),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text('Найден участник'),
                            SizedBox(height: 10),
                            Divider(color: AppColors.blue),
                            SizedBox(height: 20),
                            PassengerCard(
                              passenger: passenger!,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Way(),
                                  if (passenger!.tariff.sale != 0)
                                    CostInfo(
                                      fullCost: 25,
                                      sale: sale,
                                    ),
                                  FinalCost(cost: finalCost),
                                ],
                              ),
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: PaymentMethod(
                                    contentColor: AppColors.white,
                                    fillColor: AppColors.blueLight,
                                    icon: Icons.money,
                                    text: 'НАЛИЧНЫМИ',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: PaymentMethod(
                                    contentColor: AppColors.white,
                                    fillColor: AppColors.blueLight,
                                    icon: Icons.credit_card,
                                    text: 'БАНК. КАРТОЙ',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const PaymentMethod(
                              contentColor: AppColors.blueLight,
                              fillColor: AppColors.white,
                              icon: Icons.directions_bus_rounded,
                              text: 'ТРАНСПОРТНОЙ КАРТОЙ',
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
          ],
        ),
      ),
    );
  }
}

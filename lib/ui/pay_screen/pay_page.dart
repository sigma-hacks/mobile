import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/theme/app_colors.dart';
import 'widgets/passenger_card.dart';
import 'widgets/way.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

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
                  icon: Icon(
                    Icons.close,
                    color: AppColors.blue,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 32, bottom: 12),
              child: Expanded(
                child: Column(
                  children: [
                    Text('Найден участник'),
                    const SizedBox(height: 10),
                    Divider(color: AppColors.blue),
                    const SizedBox(height: 20),
                    PassengerCard(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Way(),
                          const SizedBox(height: 20),
                          Text('Стоимость проезда'),
                          Text(
                            '25₽',
                            // style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 20),
                          Text('К оплате'),
                          Text(
                            '13₽',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('НАЛИЧНЫМИ'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('БАНК. КАРТОЙ'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('ТРАНСПОРТНОЙ КАРТОЙ'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

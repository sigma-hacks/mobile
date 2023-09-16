import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/theme/app_colors.dart';

class QRButton extends StatelessWidget {
  const QRButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 32,
      onTap: () {
        context.pushNamed(RouteName.pay);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.blueLight, AppColors.greenLight],
          ),
        ),
        child: SvgPicture.asset(
          'assets/images/qr.svg',
          height: 64,
        ),
      ),
    );
  }
}

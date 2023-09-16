import 'package:ekzh/data/mok.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/base_screen/base_page.dart';
import '../../ui/check_screen/check_page.dart';
import '../../ui/login_screen/login_page.dart';
import '../../ui/pay_screen/pay_page.dart';
import 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.check,
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.login,
      path: RouteName.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: RouteName.base,
      path: RouteName.base,
      builder: (BuildContext context, GoRouterState state) {
        return const BasePage();
      },
    ),
    GoRoute(
      name: RouteName.pay,
      path: RouteName.pay,
      builder: (BuildContext context, GoRouterState state) {
        return PayPage(passenger: passenger);
      },
    ),
    GoRoute(
      name: RouteName.check,
      path: RouteName.check,
      builder: (BuildContext context, GoRouterState state) {
        return const CheckPage();
      },
    ),
  ],
);

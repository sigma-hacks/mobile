import 'package:ekzh/services/card_cubit.dart';
import 'package:ekzh/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../common/navigation/router.dart';
import '../common/theme/light_theme.dart';
import '../cubits/geo_cubit.dart';
import '../cubits/pin_auth_cubit.dart';
import '../cubits/ui_cubit.dart';
import '../services/geo_service.dart';
import '../services/reachability_service.dart';

class App extends StatelessWidget {
  const App({super.key, required CardRepository cardRepository}) : _cardRepository = cardRepository;
  final CardRepository _cardRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UiCubit>(
          create: (_) => UiCubit(ReachabilityService())..listenToConnectivity(),
        ),
        BlocProvider<GeoCubit>(
          create: (_) => GeoCubit(GeoService()),
        ),
        BlocProvider<PinAuthCubit>(
          create: (_) => PinAuthCubit(),
        ),
        BlocProvider<CardCubit>(
          create: (_) => CardCubit(cardRepository: _cardRepository)
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ЕКЖ',
        theme: themeLight,
        routerConfig: router,
      ),
    );
  }
}

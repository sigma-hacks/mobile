import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/ui_cubit.dart';
import '../../models/state/app_state.dart';
import 'widgets/function_off.dart';
import 'widgets/nfc_instruction.dart';
import 'widgets/registry_update.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: BlocBuilder<UiCubit, AppState>(
          builder: (context, state) {
            // return StreamBuilder<bool>(
            //   stream: isNfc,
            //   builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // Text(result.toString()),
                    if (!state.isConnection)
                      const FunctionOff(
                        text: 'Отсутствует подключение к интернету',
                      ),
                    const SizedBox(height: 8),
                    // if (snapshot.data == false)
                    // const FunctionOff(
                    //   text: 'Выключена функция NFC',
                    // ),
                    const SizedBox(height: 8),
                    RegistryUpdate(isConnect: state.isConnection),
                  ],
                ),
                NFCInstruction(isOn: true),
              ],
            );
            // },
            // );
          },
        ),
      ),
    );
  }
}

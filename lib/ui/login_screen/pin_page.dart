import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';

class PinPage extends StatelessWidget {
  static const String setupPIN = "Setup PIN";
  static const String useSixDigitsPIN = "Use 6-digits PIN";
  static const String authenticationSuccess = "Authentication success";
  static const String authenticationFailed = "Authentication failed";

  //static const String ok = "OK";

  const PinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2, child: _MainPart()),
            Expanded(flex: 3, child: _NumPad()),
          ],
        ),
      ),
    );
  }
}

class _NumPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(child: ButtonOfNumPad(num: "1", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "2", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "3", onPressed: () {})),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              children: [
                Expanded(child: ButtonOfNumPad(num: "4", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "5", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "6", onPressed: () {})),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              children: [
                Expanded(child: ButtonOfNumPad(num: "7", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "8", onPressed: () {})),
                Expanded(child: ButtonOfNumPad(num: "9", onPressed: () {})),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(child: ButtonOfNumPad(num: "0", onPressed: () {})),
                Expanded(
                    child: IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () {},
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Введите PIN-код',
            style: Theme.of(context).textTheme.headlineLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) => PinSphere(input: index < 3)),
        ),
      ],
    );
  }
}

class ButtonOfNumPad extends StatelessWidget {
  const ButtonOfNumPad({Key? key, required this.num, this.onPressed})
      : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: FloatingActionButton.extended(
        heroTag: num,
        elevation: 0,
        backgroundColor: AppColors.greyLight,
        onPressed: onPressed,
        label: Text(
          num,
          style: const TextStyle(color: AppColors.blue),
        ),
      ),
    );
  }
}

class PinSphere extends StatelessWidget {
  final bool input;
  const PinSphere({
    Key? key,
    required this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: input ? AppColors.greenDark : null,
          border: Border.all(color: AppColors.greenDark, width: 2),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

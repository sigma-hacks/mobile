import 'package:flutter/material.dart';

import '../common/wrapper.dart';
import 'widgets/begin_work.dart';
import 'widgets/work_info.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrapper(
        child: WorkInfo(),
      ),
    );
  }
}

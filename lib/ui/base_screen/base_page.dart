import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/theme/app_colors.dart';
import '../main_screen/main_page.dart';
import '../profile_screen/profile_page.dart';

class BottomItem {
  final IconData icon;
  final String label;
  const BottomItem({
    required this.icon,
    required this.label,
  });
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>
    with SingleTickerProviderStateMixin {
  int currentTab = 0;
  late TabController _tabController;
  final _bottomItems = [
    BottomItem(icon: Icons.home, label: 'Главная'),
    BottomItem(icon: Icons.person, label: 'Профиль'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _bottomItems.length);
    _tabController.addListener(() {
      currentTab = _tabController.index;
      setState(() {});
    });
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomItems[currentTab].label),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MainPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.blueLight, AppColors.greenLight])),
        child: SvgPicture.asset(
          'assets/images/qr.svg',
          height: 64,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  _bottomItems.length + 1,
                  (index) => index == _bottomItems.length ~/ 2
                      ? Spacer()
                      : Expanded(
                          child: InkWell(
                            onTap: () {
                              _onItemTapped(index);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _bottomItems[index >= _bottomItems.length ~/ 2
                                          ? index - 1
                                          : index]
                                      .icon,
                                  color: currentTab ==
                                          (index >= _bottomItems.length ~/ 2
                                              ? index - 1
                                              : index)
                                      ? AppColors.blue
                                      : AppColors.greyDark,
                                ),
                                Text(
                                  _bottomItems[index > _bottomItems.length ~/ 2
                                          ? index - 1
                                          : index]
                                      .label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: currentTab ==
                                                  (index >=
                                                          _bottomItems.length ~/
                                                              2
                                                      ? index - 1
                                                      : index)
                                              ? AppColors.blue
                                              : AppColors.greyDark),
                                ),
                              ],
                            ),
                          ),
                        ))),
        ),
      ),
    );
  }
}

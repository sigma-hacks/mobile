import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/theme/app_colors.dart';
import '../main_screen/main_page.dart';
import '../profile_screen/profile_page.dart';

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
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.question_mark), label: 'что-то'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.question_mark), label: 'что-то'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
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
        title: Text(_bottomItems[currentTab].label!),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MainPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: AppColors.blue,
        child: SvgPicture.asset('assets/images/qr.svg'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: currentTab,
        onTap: _onItemTapped,
      ),
    );
  }
}

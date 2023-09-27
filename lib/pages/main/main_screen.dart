import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:praktik_dokter/bloc/logout/logout_bloc.dart';
import 'package:praktik_dokter/pages/auth/login_screen.dart';
import 'package:praktik_dokter/pages/history/history_screen.dart';
import 'package:praktik_dokter/pages/home/home_screen.dart';
import 'package:praktik_dokter/pages/profile/profile_screen.dart';
import 'package:praktik_dokter/theme.dart';

import '../../data/datasources/auth_local_datasource.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  bool singleVendor = false;

  String token = '';
  @override
  void initState() {
    super.initState();

    AuthLocalDatasource().getToken().then((value) {
      setState(() {
        token = value;
      });
    });

    _screens = [
      HomeScreen(),
      HistoryScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(token)),
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
        showUnselectedLabels: true,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: _getBottomWidget(singleVendor),
        onTap: (int index) {
          _setPage(index);
        },
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens[index];
        },
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  BottomNavigationBarItem _barItem(String icon, String? label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: index == _pageIndex
              ? primaryColor
              : secondaryTextColor!.withOpacity(0),
        ),
        child: SvgPicture.asset(
          icon,
          color: index == _pageIndex
              ? whiteColor
              : secondaryTextColor!.withOpacity(0.5),
          height: 25,
          width: 25,
        ),
      ),
      label: '',
    );
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> list = [];
    list.add(_barItem('assets/home-icon.svg', 'Home', 0));
    list.add(_barItem('assets/history-icon.svg', 'History', 1));
    list.add(_barItem('assets/profile-icon.svg', 'Profile', 2));
    return list;
  }
}

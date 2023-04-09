import 'package:flutter/material.dart';
import 'package:kemet/constants/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'camera_screen.dart';
import 'homepage.dart';
import 'navigation.dart';
import 'user_choice.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PersistentTabController? _controller;

  final List<Widget> _screens = [
    const HomePage(),
    const CameraScreen(),
    const SwipeScreen(),
    Container(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.cloud_upload_rounded),
        title: 'Upload',
        activeColorPrimary: const Color.fromARGB(255, 182, 110, 3),
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.camera_alt_sharp),
        title: 'Camera',
        activeColorPrimary: const Color.fromARGB(255, 78, 76, 76),
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: const Color.fromARGB(255, 30, 141, 232),
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_rounded),
        title: 'Search',
        activeColorPrimary: const Color.fromARGB(255, 3, 95, 6),
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: const Color.fromARGB(255, 11, 89, 153),
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: ConstantsColors.primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style7,
      navBarHeight: 65,
      // onItemSelected: (index) {
      //   setState(() {});
      // },
    );
  }
}

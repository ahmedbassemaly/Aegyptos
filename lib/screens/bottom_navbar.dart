import 'package:flutter/material.dart';
import 'package:kemet/constants/constants.dart';
import 'package:kemet/screens/profile.dart';
import 'package:kemet/screens/search.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'translation.dart';
import 'navigation.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isCamera = false;
  PersistentTabController? _controller;

  final List<Widget> _screens = [
    const Translation(
      isCamera: false,
    ),
    const Translation(
      isCamera: true,
    ),
    const SwipeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.cloud_upload_rounded),
        title: 'Upload',
        activeColorPrimary: ConstantsColors.activeNavBarColorPrimary,
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.camera_alt_sharp),
        title: 'Camera',
        activeColorPrimary: ConstantsColors.activeNavBarColorPrimary,
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: ConstantsColors.activeNavBarColorPrimary,
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_rounded),
        title: 'Search',
        activeColorPrimary: ConstantsColors.activeNavBarColorPrimary,
        inactiveColorPrimary: ConstantsColors.inactiveNavBarColor,
        activeColorSecondary: ConstantsColors.activeNavBarColorSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: ConstantsColors.activeNavBarColorPrimary,
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
    );
  }
}

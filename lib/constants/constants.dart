import 'package:flutter/material.dart';

bool iconDark = false;

class ConstantsColors {
  static Color primaryColor = iconDark
      ? const Color.fromARGB(255, 0, 67, 93)
      : const Color.fromARGB(255, 243, 199, 148);

  //dark theme
  static Color darkPrimaryColor = const Color.fromARGB(255, 0, 67, 93);

  static Color secondaryColor = const Color(0xFF7393b3);
  static Color inactiveNavBarColor = iconDark ? Colors.white : Colors.black;
  static Color darkInactiveNavBarColor = Colors.white;
  static Color activeNavBarColorSecondary = Colors.white;
  static Color activeNavBarColorPrimary = iconDark
      ? const Color.fromARGB(255, 1, 43, 59)
      : const Color.fromARGB(255, 182, 110, 3);

  //dark theme
  static Color darkActiveNavBarColorPrimary =
      const Color.fromARGB(255, 1, 43, 59);
}

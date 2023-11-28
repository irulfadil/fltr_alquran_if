import 'package:flutter/material.dart';

import '../utils/color_system.dart';

// Theme lightMode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorSystem.backgroundDark,
  ),
  primaryColor: ColorSystem.appColorGreen,
  scaffoldBackgroundColor: ColorSystem.backgroundLight,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: ColorSystem.appColorGreen,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: ColorSystem.appColorBrown),
    titleLarge: TextStyle(color: ColorSystem.appColorBrown),
    titleMedium: TextStyle(color: ColorSystem.appColorBrown),
    titleSmall: TextStyle(color: ColorSystem.appColorTeal),
    bodyLarge: TextStyle(color: ColorSystem.appColorBrown),
    bodyMedium: TextStyle(color: ColorSystem.appColorBrown),
    bodySmall: TextStyle(color: ColorSystem.appColorBrown),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ColorSystem.appColorGreen,
        ),
      ),
    ),
    unselectedLabelColor: ColorSystem.appColorGray,
    labelColor: ColorSystem.appColorBrown,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(
        ColorSystem.headerLight), // Warna untuk toggle switch
    trackColor: MaterialStateProperty.all(
        ColorSystem.appColorGray), // Warna untuk track switch
  ),
);

// Theme darkMode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorSystem.backgroundLight),
  primaryColor: ColorSystem.appColorGreen,
  scaffoldBackgroundColor: ColorSystem.backgroundDark,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: ColorSystem.backgroundDark,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: ColorSystem.appColorWhite),
    titleLarge: TextStyle(color: ColorSystem.appColorWhite),
    titleMedium: TextStyle(color: ColorSystem.appColorWhite),
    titleSmall: TextStyle(color: ColorSystem.appColorTeal),
    bodyLarge: TextStyle(color: ColorSystem.appColorWhite),
    bodyMedium: TextStyle(color: ColorSystem.appColorWhite),
    bodySmall: TextStyle(color: ColorSystem.appColorWhite),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ColorSystem.appColorGold,
        ),
      ),
    ),
    unselectedLabelColor: ColorSystem.appColorGray,
    labelColor: ColorSystem.appColorBrown,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(
        ColorSystem.appColorTeal), // Warna untuk toggle switch
    trackColor: MaterialStateProperty.all(
        ColorSystem.appColorGray), // Warna untuk track switch
  ),
);

import 'package:flutter/material.dart';

const appBarGreen = Color(0xFF186340);

const appColorGold = Color(0xFFd1ac44);
const appColorBrown = Color(0xFFc5ab90);
const appColorGreen = Color(0xFF186340);
const appColorTeal = Color(0xFF1d8e81);

const appColorWhite = Color(0xFFFFFFFF);
const appColorGray = Color(0xFF858585);
const appColorBlack = Color(0xFF000000);

const backgroundLight = Color(0xFFF6F1E9);

const backgroundDark = Color(0xFF111B21);
const backgroundDarkSecondary = Color(0xFF353837);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: backgroundDark),
  primaryColor: appBarGreen,
  scaffoldBackgroundColor: backgroundLight,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: appBarGreen,
  ),
  // colorScheme: ColorScheme.light(
  //   background: Colors.grey.shade600,
  //   primary: appBarGreen,
  //   secondary: Colors.grey.shade200,
  // ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: appColorBrown),
    titleMedium: TextStyle(color: appColorBrown),
    titleSmall: TextStyle(color: appColorTeal),
    bodyLarge: TextStyle(color: appColorBrown),
    bodyMedium: TextStyle(color: appColorBrown),
    bodySmall: TextStyle(color: appColorBrown),
  ),
  // listTileTheme: const ListTileThemeData(textColor: appColorTeal),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appColorGreen,
        ),
      ),
    ),
    unselectedLabelColor: appColorGray,
    labelColor: appColorBrown,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: backgroundLight),
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: backgroundDark,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: backgroundDarkSecondary,
  ),
  // colorScheme: ColorScheme.dark(
  //   background: Colors.grey.shade900,
  //   primary: Colors.grey.shade800,
  //   secondary: Colors.grey.shade700,
  // ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: appColorWhite),
    titleMedium: TextStyle(color: appColorWhite),
    titleSmall: TextStyle(color: appColorTeal),
    bodyLarge: TextStyle(color: appColorWhite),
    bodyMedium: TextStyle(color: appColorWhite),
    bodySmall: TextStyle(color: appColorWhite),
  ),
  // listTileTheme: const ListTileThemeData(textColor: appColorTeal),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: appColorGold,
        ),
      ),
    ),
    unselectedLabelColor: appColorGray,
    labelColor: appColorBrown,
  ),
);

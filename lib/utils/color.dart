import 'package:flutter/material.dart';

const appColorGreen = Color(0xFF244e4d);
const appColorGold = Color(0xFFd1ac44);
const appColorBrown = Color(0xFF998570);
const appColorTeal = Color(0xFF1d8e81);

const appColorWhite = Color(0xFFFFFFFF);
const appColorGray = Color(0xFF939393);
const appColorBlack = Color(0xFF000000);

const appColorDark = Color(0xFF6E6657);
const appColorLight = Color(0xFF000000);

const headerLight = Color(0xFFc0bb9e);
const headerDark = Color(0xFF6E6657);

// const backgroundLight = Color(0xFFF6F1E9);
const backgroundLight = Color(0xFFFFFFFF);

// const backgroundDark = Color(0xFF111B21);
// const backgroundDarkSecondary = Color(0xFF353837);

const backgroundDark = Color(0xFF101010);
const backgroundDarkSecondary = Color(0xFF151516);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: backgroundDark),
  primaryColor: appColorGreen,
  scaffoldBackgroundColor: backgroundLight,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: appColorGreen,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: appColorBrown),
    titleLarge: TextStyle(color: appColorBrown),
    titleMedium: TextStyle(color: appColorGreen),
    titleSmall: TextStyle(color: appColorTeal),
    bodyLarge: TextStyle(color: appColorBrown),
    bodyMedium: TextStyle(color: appColorBrown),
    bodySmall: TextStyle(color: appColorBrown),
  ),
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
  primaryColor: appColorGreen,
  scaffoldBackgroundColor: backgroundDark,
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: backgroundDark,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: appColorWhite),
    titleLarge: TextStyle(color: appColorWhite),
    titleMedium: TextStyle(color: appColorWhite),
    titleSmall: TextStyle(color: appColorTeal),
    bodyLarge: TextStyle(color: appColorWhite),
    bodyMedium: TextStyle(color: appColorWhite),
    bodySmall: TextStyle(color: appColorWhite),
  ),
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

import 'package:flutter/material.dart';

const appBarGreen = Color(0xFF186340);
const appFontGold = Color(0xFFd1ac44);
const appFontBrown = Color(0xFFc5ab90);
const appFontGreen = Color(0xFF186340);

const appFontWhite = Color(0xFFFFFFFF);
const appFontGray = Color(0xFF858585);
const appFontBlack = Color(0xFF000000);

const iconBrown = Color(0xFFc5ab90);
const buttonGreen = Color(0xFF1d8e81);

const backgroundwhite = Color(0xFFFFFFFF);
const backgroundLight = Color(0xFFf0f0f0);

// const backgroundDark = Color(0xFF2f3231);
const backgroundDark = Color(0xFF111B21);
const backgroundDarkLight = Color(0xFF353837);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade600,
    primary: appBarGreen,
    secondary: Colors.grey.shade200,
    // background: Colors.grey.shade600,
    // primary: Colors.grey.shade400,
    // secondary: Colors.grey.shade200,
  ),
  // primaryColor: Colors.redAccent,
  // scaffoldBackgroundColor: backgroundLight,
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: appBarGreen,
  // ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: appFontBlack),
    titleMedium: TextStyle(color: appFontBlack),
    titleSmall: TextStyle(color: appFontGreen),
    bodyLarge: TextStyle(color: appFontBlack),
    bodyMedium: TextStyle(color: appFontBlack),
    bodySmall: TextStyle(color: appFontBlack),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    // background: Colors.grey.shade900,
    // primary: Colors.grey.shade800,
    // secondary: Colors.grey.shade700,
  ),
  // primaryColor: Colors.redAccent,
  // scaffoldBackgroundColor: backgroundDark,
  // appBarTheme: const AppBarTheme(
  //   backgroundColor: backgroundDark,
  // ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: appFontWhite),
    titleMedium: TextStyle(color: appFontWhite),
    titleSmall: TextStyle(color: appFontWhite),
    bodyLarge: TextStyle(color: appFontWhite),
    bodyMedium: TextStyle(color: appFontWhite),
    bodySmall: TextStyle(color: appFontWhite),
  ),
);

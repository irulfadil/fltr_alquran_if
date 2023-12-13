import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class AppTheme {
  // Theme lightMode
  static final lightMode = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorSystem.appColorGreen,
    scaffoldBackgroundColor: ColorSystem.backgroundLight,
    fontFamily: "Poppins",
    appBarTheme: const AppBarTheme(
      elevation: 4,
      backgroundColor: ColorSystem.appColorGreen,
      iconTheme: IconThemeData(
        color: ColorSystem.appColorWhite,
        size: 24.0,
      ),
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
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: ColorSystem.appColorBrown,
      ),
      subtitleTextStyle: TextStyle(
        color: ColorSystem.appColorBrown,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        color: ColorSystem.appColorBrown,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(ColorSystem.appColorGrayDark),
      trackColor: MaterialStateProperty.all(ColorSystem.appColorGray),
    ),
  );

  // Theme darkMode
  static final darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorSystem.appColorGreen,
    scaffoldBackgroundColor: ColorSystem.backgroundDark,
    fontFamily: "Poppins",
    appBarTheme: const AppBarTheme(
      elevation: 4,
      backgroundColor: ColorSystem.backgroundDark,
      iconTheme: IconThemeData(
        color: ColorSystem.appColorWhite,
        size: 24.0,
      ),
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
    listTileTheme: const ListTileThemeData(
      // textColor: ColorSystem.appColorWhite,
      titleTextStyle: TextStyle(
        color: ColorSystem.appColorGray,
      ),
      subtitleTextStyle: TextStyle(
        color: ColorSystem.appColorGray,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        color: ColorSystem.appColorGray,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(ColorSystem.appColorTeal),
      trackColor: MaterialStateProperty.all(ColorSystem.appColorGray),
    ),
  );
}

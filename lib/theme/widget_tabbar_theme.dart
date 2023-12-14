import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class TTabBarTheme {
  static TabBarTheme tabBarLightTheme = const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ColorSystem.appColorGreen,
        ),
      ),
    ),
    unselectedLabelColor: ColorSystem.appColorGray,
    labelColor: ColorSystem.appColorBrown,
  );

  static TabBarTheme tabBarDarkTheme = const TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ColorSystem.appColorGold,
        ),
      ),
    ),
    unselectedLabelColor: ColorSystem.appColorGray,
    labelColor: ColorSystem.appColorBrown,
  );
}

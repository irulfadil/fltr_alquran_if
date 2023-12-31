import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class TTabBarTheme {
  TTabBarTheme._();
  
  static TabBarTheme lightTabBarTheme = const TabBarTheme(
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

  static TabBarTheme darkTabBarTheme = const TabBarTheme(
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

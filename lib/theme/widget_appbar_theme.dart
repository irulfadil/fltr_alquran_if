import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class AappBarTheme {
  static AppBarTheme appBarLightTheme = const AppBarTheme(
    elevation: 4,
    backgroundColor: ColorSystem.appColorGreen,
    iconTheme: IconThemeData(
      color: ColorSystem.appColorWhite,
      size: 24.0,
    ),
  );

  static AppBarTheme appBarDarkTheme = const AppBarTheme(
    elevation: 4,
    backgroundColor: ColorSystem.backgroundDark,
    iconTheme: IconThemeData(
      color: ColorSystem.appColorWhite,
      size: 24.0,
    ),
  );
}

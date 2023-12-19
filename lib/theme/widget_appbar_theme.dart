import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class AappBarTheme {
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
      elevation: 4,
      backgroundColor: ColorSystem.appColorGreen,
      iconTheme: IconThemeData(
        color: ColorSystem.appColorWhite,
        size: 24.0,
      ),
      titleTextStyle: TextStyle(
        color: ColorSystem.appColorWhite,
        fontSize: 16.0,
      ));

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      elevation: 4,
      backgroundColor: ColorSystem.backgroundDark,
      iconTheme: IconThemeData(
        color: ColorSystem.appColorWhite,
        size: 24.0,
      ),
      titleTextStyle: TextStyle(
        color: ColorSystem.appColorWhite,
        fontSize: 16.0,
      ));
}

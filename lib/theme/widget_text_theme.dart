import 'package:flutter/material.dart';
import '../utils/color_system.dart';

class TTextTheme {
  static TextTheme textLightTheme = const TextTheme(
    headlineSmall: TextStyle(color: ColorSystem.appColorBrown),
    titleLarge: TextStyle(color: ColorSystem.appColorBrown),
    titleMedium: TextStyle(color: ColorSystem.appColorBrown),
    titleSmall: TextStyle(color: ColorSystem.appColorTeal),
    bodyLarge: TextStyle(color: ColorSystem.appColorBrown),
    bodyMedium: TextStyle(color: ColorSystem.appColorBrown),
    bodySmall: TextStyle(color: ColorSystem.appColorBrown),
  );

  static TextTheme textDarkTheme = const TextTheme(
    headlineSmall: TextStyle(color: ColorSystem.appColorWhite),
    titleLarge: TextStyle(color: ColorSystem.appColorWhite),
    titleMedium: TextStyle(color: ColorSystem.appColorWhite),
    titleSmall: TextStyle(color: ColorSystem.appColorTeal),
    bodyLarge: TextStyle(color: ColorSystem.appColorWhite),
    bodyMedium: TextStyle(color: ColorSystem.appColorWhite),
    bodySmall: TextStyle(color: ColorSystem.appColorWhite),
  );
}

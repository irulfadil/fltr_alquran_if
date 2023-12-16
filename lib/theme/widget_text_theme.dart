import 'package:flutter/material.dart';
import '../utils/color_system.dart';

class TTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    // fontSize: 34
    displayLarge: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 28
    displayMedium: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 22
    displaySmall: TextStyle(fontSize: 22),

    // fontSize: 20
    headlineLarge: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 18
    headlineMedium: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 16
    headlineSmall: TextStyle(color: ColorSystem.appColorBrown),

    // fontSize: 24
    titleLarge: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 20
    titleMedium: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 18
    titleSmall: TextStyle(color: ColorSystem.appColorBrown),

    // fontSize: 18
    bodyLarge: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 16
    bodyMedium: TextStyle(color: ColorSystem.appColorBrown),
    // fontSize: 14
    bodySmall: TextStyle(color: ColorSystem.appColorBrown),

    // fontSize: 18
    labelLarge: TextStyle(color: ColorSystem.appColorWhite),
    // fontSize: 16
    labelMedium: TextStyle(color: ColorSystem.appColorWhite),
    // fontSize: 14
    labelSmall: TextStyle(color: ColorSystem.appColorTeal),
  );

  static TextTheme darkTextTheme = const TextTheme(
    // fontSize: 34
    displayLarge: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 28
    displayMedium: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 22
    displaySmall: TextStyle(fontSize: 22),

    // fontSize: 20
    headlineLarge: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 18
    headlineMedium: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 16
    headlineSmall: TextStyle(color: ColorSystem.appColorGray),

    // fontSize: 24
    titleLarge: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 20
    titleMedium: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 18
    titleSmall: TextStyle(color: ColorSystem.appColorGray),

    // fontSize: 18
    bodyLarge: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 16
    bodyMedium: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 14
    bodySmall: TextStyle(color: ColorSystem.appColorGray),

    // fontSize: 18
    labelLarge: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 16
    labelMedium: TextStyle(color: ColorSystem.appColorGray),
    // fontSize: 14
    labelSmall: TextStyle(color: ColorSystem.appColorTeal),
  );
}

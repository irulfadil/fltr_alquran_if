import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class PpopMenuTheme {
  PpopMenuTheme._();
  
  static PopupMenuThemeData lightPopupMenuTheme = const PopupMenuThemeData(
    color: ColorSystem.backgroundLight,
    textStyle: TextStyle(
      color: ColorSystem.appColorBrown,
    ),
  );
  static PopupMenuThemeData darkPopupMenuTheme = const PopupMenuThemeData(
    color: ColorSystem.backgroundDarkSecondary,
    textStyle: TextStyle(
      color: ColorSystem.appColorGray,
    ),
  );
}

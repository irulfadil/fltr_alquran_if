import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class TListTileTheme {
  static ListTileThemeData lightListTileTheme = const ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      color: ColorSystem.appColorBrown,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14.0,
      color: ColorSystem.appColorBrown,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      fontSize: 14.0,
      color: ColorSystem.appColorBrown,
    ),
    iconColor: ColorSystem.appColorTeal,
  );

  static ListTileThemeData darkListTileTheme = const ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      color: ColorSystem.appColorGray,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14.0,
      color: ColorSystem.appColorGray,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      fontSize: 14.0,
      color: ColorSystem.appColorGray,
    ),
    iconColor: ColorSystem.appColorGray,
  );
}

import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class TListTileTheme {
  static ListTileThemeData listTileLightTheme = const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: ColorSystem.appColorBrown,
    ),
    subtitleTextStyle: TextStyle(
      color: ColorSystem.appColorBrown,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      color: ColorSystem.appColorBrown,
    ),
  );

  static ListTileThemeData listTileDarkTheme = const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: ColorSystem.appColorGray,
    ),
    subtitleTextStyle: TextStyle(
      color: ColorSystem.appColorGray,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      color: ColorSystem.appColorGray,
    ),
  );
}

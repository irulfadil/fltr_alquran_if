import 'package:flutter/material.dart';

import '../utils/color_system.dart';
import 'widget_appbar_theme.dart';
import 'widget_listtile_theme.dart';
import 'widget_switch_theme.dart';
import 'widget_tabbar_theme.dart';
import 'widget_text_theme.dart';

class AppTheme {
  // Theme lightMode
  static final lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorSystem.backgroundLight,
    fontFamily: "Poppins",
    appBarTheme: AappBarTheme.appBarLightTheme,
    textTheme: TTextTheme.textLightTheme,
    tabBarTheme: TTabBarTheme.tabBarLightTheme,
    listTileTheme: TListTileTheme.listTileLightTheme,
    switchTheme: SSwitchTheme.switchlightTheme,
  );

  // Theme darkMode
  static final darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorSystem.backgroundDark,
    fontFamily: "Poppins",
    appBarTheme: AappBarTheme.appBarDarkTheme,
    textTheme: TTextTheme.textDarkTheme,
    tabBarTheme: TTabBarTheme.tabBarDarkTheme,
    listTileTheme: TListTileTheme.listTileDarkTheme,
    switchTheme: SSwitchTheme.switchDarkTheme,
  );
}

import 'package:flutter/material.dart';

import '../utils/color_system.dart';
import 'widget_appbar_theme.dart';
import 'widget_iconbutton_theme.dart';
import 'widget_listtile_theme.dart';
import 'widget_popmenu.dart';
import 'widget_radio_theme.dart';
import 'widget_switch_theme.dart';
import 'widget_tabbar_theme.dart';
import 'widget_text_theme.dart';

class AppTheme {
  // Theme lightMode
  static final lightMode = ThemeData(
    // brightness: Brightness.light,
    scaffoldBackgroundColor: ColorSystem.backgroundLight,
    dialogBackgroundColor: ColorSystem.backgroundLight,
    fontFamily: "Poppins",
    appBarTheme: AappBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTextTheme,
    tabBarTheme: TTabBarTheme.lightTabBarTheme,
    listTileTheme: TListTileTheme.lightListTileTheme,
    switchTheme: SSwitchTheme.lightSwitchTheme,
    iconTheme: IiconButtonTheme.lightIconTheme,
    radioTheme: RradioTheme.lightRadioTheme,
   popupMenuTheme: PpopMenuTheme.lightPopupMenuTheme,
  );

  // Theme darkMode
  static final darkMode = ThemeData(
    // brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorSystem.backgroundDark,
    dialogBackgroundColor: ColorSystem.backgroundDarkSecondary,
    fontFamily: "Poppins",
    appBarTheme: AappBarTheme.darkAppBarTheme,
    textTheme: TTextTheme.darkTextTheme,
    tabBarTheme: TTabBarTheme.darkTabBarTheme,
    listTileTheme: TListTileTheme.darkListTileTheme,
    switchTheme: SSwitchTheme.darkSwitchTheme,
    iconTheme: IiconButtonTheme.darkIconTheme,
    radioTheme: RradioTheme.darkRadioTheme,
    popupMenuTheme: PpopMenuTheme.darkPopupMenuTheme,
  );
}

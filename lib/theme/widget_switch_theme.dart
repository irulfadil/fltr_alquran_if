import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class SSwitchTheme {
  static SwitchThemeData switchlightTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.all(ColorSystem.appColorGrayDark),
    trackColor: MaterialStateProperty.all(ColorSystem.appColorGray),
  );
  static SwitchThemeData switchDarkTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.all(ColorSystem.appColorTeal),
    trackColor: MaterialStateProperty.all(ColorSystem.appColorGray),
  );
}

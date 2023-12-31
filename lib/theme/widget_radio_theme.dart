import 'package:flutter/material.dart';

import '../utils/color_system.dart';

class RradioTheme {
  RradioTheme._();
  
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ColorSystem.appColorBrown;
      } else {
        return ColorSystem.appColorGray;
      }
    }),
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ColorSystem.appColorTeal;
      } else {
        return ColorSystem.appColorGray;
      }
    }),
  );
}

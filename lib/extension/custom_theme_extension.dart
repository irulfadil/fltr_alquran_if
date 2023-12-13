import 'package:flutter/material.dart';

import '../utils/color_system.dart';

//2. create extention
extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

//1. create class CustomThemeExtension
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? headerColor;

  const CustomThemeExtension({
    this.headerColor,
  });
  // mode light
  static const lightMode = CustomThemeExtension(
    headerColor: ColorSystem.appColorGreen,
  );

  // mode dark
  static const darkMode = CustomThemeExtension(
    headerColor: ColorSystem.appColorBrown,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? headerColor,
  }) {
    return CustomThemeExtension(
      headerColor: headerColor ?? this.headerColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      headerColor: Color.lerp(headerColor, other.headerColor, t),
    );
  }
}

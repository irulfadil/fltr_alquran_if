import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;
  RxBool isEnabledTranslate = true.obs;

  // void toggleTheme(bool value) {
  //   isDark.value = value;
  // }

  void detectSystemTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    brightness == Brightness.dark ? isDark.value = true : isDark.value = false;
    update();
    Get.log("Theme isDark: $isDark");
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../theme_control/theme_control.dart';

class SettingController extends GetxController {
  final themeC = Get.find<ThemeController>();
  final ThemeController themeController = Get.put(ThemeController());
  final box = GetStorage();

  RxInt isfontSizeArabic = 24.obs;
  RxString selectedThemeModeCurent = 'light'.obs;
  RxString selectdValueFontArabic = 'utsmani'.obs;

  // Function save fontSie in getStore
  void saveFontSizeArabic() {
    box.write('isfontSizeArabic', isfontSizeArabic.value);
  }

  // Function read FontSize in getStore
  void loadFontSizeArabic() {
    isfontSizeArabic.value = box.read('isfontSizeArabic') ?? 24;
  }

  // Function save themeCurrent in getStore
  void saveThemeCurrent() {
    box.write('isThemeCurrent', selectedThemeModeCurent.value);
  }

  // Function read themeCurrent in getStore
  void loadThemeCurrent() {
    selectedThemeModeCurent.value = box.read('isThemeCurrent') ?? 'light';
  }

  // Function Toggle Theme Mode
  void changeThemeMode(value, context) {
    Get.log("isDarkMode: ${Get.isDarkMode}");
    switch (value) {
      case "light":
        themeC.isDark.value = false;
        Get.changeThemeMode(ThemeMode.light);
        Get.isDarkMode ? box.remove('dbtheme') : box.write('dbtheme', value);

        Get.log('Thema: $value');
        Get.log('StorageDarkMode: ${box.read('dbtheme')}');
        break;
      case "dark":
        themeC.isDark.value = true;
        Get.changeThemeMode(ThemeMode.dark);
        Get.isDarkMode ? box.remove('dbtheme') : box.write('dbtheme', value);

        Get.log('Thema: $value');
        Get.log('StorageDarkMode: ${box.read('dbtheme')}');
        break;
      case "perangkat":
        themeController.detectSystemTheme(context);
        // themeC.isDark.value = true;
        Get.changeThemeMode(ThemeMode.system);
        Get.isDarkMode ? box.remove('dbtheme') : box.write('dbtheme', value);

        Get.log('Thema: $value');
        Get.log('StorageDarkMode: ${box.read('dbtheme')}');
        break;
      default:
        break;
    }
  }
}

//Get.isDarkMode => ini berfungsi jika ThemeMode dinonaktif.

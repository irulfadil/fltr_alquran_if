// ignore_for_file: avoid_print

import 'package:fltr_alquran_if/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../theme/app_theme.dart';

class SettingController extends GetxController {
  final homeC = Get.find<HomeController>();
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
    selectedThemeModeCurent.value = box.read('isThemeCurrent') ?? 'device';
  }

  // Function Toggle Theme Mode
  void changeThemeMode(value) {
    print('Get.isDarkMode: ${Get.isDarkMode}');
    homeC.isDark.toggle();
    switch (value) {
      case "light":
        homeC.isDark.value = false;
        Get.changeTheme(AppTheme.lightMode);

        if (Get.isDarkMode) {
          box.remove('darkMode');
        } else {
          box.write('darkMode', value);
        }
        print('Thema: $value');
        break;
      case "dark":
        homeC.isDark.value = true;
        Get.changeTheme(AppTheme.darkMode);

        if (Get.isDarkMode) {
          box.remove('darkMode');
        } else {
          box.write('darkMode', value);
        }
        print('Thema: $value');
        break;
      case "device":
        if (Get.isDarkMode) {
          box.remove('darkMode');
        } else {
          box.write('darkMode', value);
        }
        print('Thema: $value');
        break;
      default:
        break;
    }
  }
}

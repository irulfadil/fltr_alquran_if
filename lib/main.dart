import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:fltr_alquran_if/app/modules/qiblah/controllers/qiblah_controller.dart';
import 'app/modules/prayer_schedule/controllers/prayer_schedule_controller.dart';
import 'app/modules/theme_control/theme_control.dart';
import 'app/routes/app_pages.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // for splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  //initialize get storage
  await GetStorage.init();
  runApp(MyApp());
}

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(PrayerScheduleController());
    Get.put(QiblahController());
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String? savedTheme = box.read('dbtheme');
    ThemeMode selectedModeSystem = ThemeMode.light;

    if (savedTheme != null) {
      if (savedTheme == 'perangkat') {
        selectedModeSystem = ThemeMode.system;
        themeController.detectSystemTheme(context);
      } else if (savedTheme == 'light') {
        selectedModeSystem = ThemeMode.light;
      } else {
        selectedModeSystem = ThemeMode.dark;
      }
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: const Locale('id', 'ID'),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: AppTheme.darkMode,
      theme: AppTheme.lightMode,
      themeMode: selectedModeSystem,
      initialBinding: ThemeBinding(),
      title: 'Al Quran Online',
      initialRoute: box.read('isSkipIntro') == null
          ? Routes.introduction
          : Routes.accessMenu,
      getPages: AppPages.routes,
    );
  }
}

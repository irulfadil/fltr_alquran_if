import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/theme_control/theme_control.dart';
import 'theme/app_theme.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // these keeps the splash screen on until it loaded up all neccessary data
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

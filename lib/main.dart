import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/widget_app_theme.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  //initialize get storage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    ThemeData selectedTheme = AppTheme.lightMode;
    String? savedTheme = box.read('darkMode');

    if (savedTheme != null) {
      if (savedTheme == "dark") {
        selectedTheme = AppTheme.darkMode;
      } else if (savedTheme == "light") {
        selectedTheme = AppTheme.lightMode;
      }
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:
      //     box.read('darkMode') == null ? AppTheme.lightMode : AppTheme.darkMode,
      theme: selectedTheme,
      title: 'Al Quran App',
      initialRoute: box.read('isSkipIntro') == null
          ? Routes.introduction
          : Routes.accessMenu,
      getPages: AppPages.routes,
    );
  }
}
